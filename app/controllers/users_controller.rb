class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path, notice: "Welcome aboard, #{@user.fname}!"
    else
      render :new
    end
  end

  def index
    @user = User.all
  end

  protected

  def user_params
    params.require(:user).permit(:email, :fname, :lname, :password, :password_confirmation, :region, :avatar_url, :age, :description)
  end

end
