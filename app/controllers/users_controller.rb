class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def index
    @user = User.all
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password)
  end


end
