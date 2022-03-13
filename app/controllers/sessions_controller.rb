class SessionsController < ApplicationController
  def new
  end

  def create
    entered_email = params["email"]
    entered_password = params["password"]

    #check email
    @user = User.find_by({email: entered_email}) # use "find_by" when expecting exactly one item

    if @user #yes, email matched; now check the password
        if BCrypt::Password.new(@user.password) == entered_password
          session["user_id"] = @user.id
          flash[:notice] = "Welcome!"
          redirect_to "/posts" #password matches
        else #password doesn't match, send back to login page
          flash[:notice] = "Password is incorrect"
          redirect_to "/sessions/new" 
        end
    else 
        flash[:notice] = "User name does not exist"
        redirect_to "/users/new"
    end
  end

  def destroy
    session["user_id"] = nil
    flash[:notice] = "You have been logged out"
    redirect_to "/sessions/new"
  end

end
  