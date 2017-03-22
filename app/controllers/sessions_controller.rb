class SessionsController < ApplicationController

  def new
    if current_user.present?
      redirect_to root_path
    end
  end

  def create
    user = User.authenticate(user_params)
    if user
      session[:user_id] = user.id
      cookies.signed[:user_id] = user.id
      flash[:success] = "Welcome #{user.name.capitalize}. You have logged in."
      redirect_to products_path
    end  
  end

  def destroy
    session[:user_id] = nil
    cookies.signed[:user_id] = nil
    flash[:success] = "You have logged out."
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
