class UsersController < ApplicationController

  before_filter :restrict_access, :except => [:new, :create]

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

    # favorite(current_user)
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

  def favorite(current_user)
    @user = current_user
    reviews = @user.reviews.where(favorite: true)

    bottle_ids = []

    reviews.each do |review|
      bottle_ids << review.bottle_id
    end

    favorite_bottles = []

    bottle_ids.each do |bottle|
      favorite_bottles << Bottle.find(bottle)
    end
    
    return favorite_bottles

  end

  protected

  def user_params
    params.require(:user).permit(:email, :fname, :lname, :password, :password_confirmation, :avatar_url, :birthday, :description)
  end

end
