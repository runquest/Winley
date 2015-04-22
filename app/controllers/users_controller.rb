class UsersController < ApplicationController
  before_filter :restrict_access

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Welcome aboard, #{@user.fname}!"
    else
      render :new
    end
  end

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end 

  protected

  def user_params
    params.require(:user).permit(:id, :email, :fname, :lname, :password, :password_confirmation, :region, :avatar_url, :age, :description)
  end

end
