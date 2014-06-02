class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def new
    @title = "Sign up"
  end
  
  def show
    @user = User.find(params[:id])
  end
end
