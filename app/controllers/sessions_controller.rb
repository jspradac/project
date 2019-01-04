class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to restaurants_path
  end

  def logout
    session[:user_id] = []
    redirect_to new_session_path
  end

end
