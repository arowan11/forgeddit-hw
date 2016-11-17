class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    session["message"] = "Thank you for signing up!"
    if @user.save
      redirect_to shares_path
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :email, :nick_name)
  end
end