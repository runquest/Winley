 class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
      flash[:notice] = "Welcome back, #{user.fname}!"

    else
      flash.now[:alert] = "Log in failed...Try again."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Adios!"
  end

end