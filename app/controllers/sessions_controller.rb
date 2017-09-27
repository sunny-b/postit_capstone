class SessionsController < ApplicationController
  before_action :require_user, only: [:destroy]

  def new; end

  def create
    user = User.find_by(username: params[:username])
               .try(:authenticate, params[:password])

    if user
      flash[:notice] = "Welcome #{user.username}!"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = 'There is something wrong with your username or password'
      redirect_to login_path
    end
  end

  def destroy
    user = current_user
    flash[:notice] = "Goodbye #{user.username}"

    session[:user_id] = nil
    redirect_to root_path
  end
end
