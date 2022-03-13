class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    plain_text_password = params["user"]["password"]
    @user = User.new(params["user"])
    @user.password = BCrypt::Password.create(plain_text_password)
    @user.save
    redirect_to "/"
  end
end
