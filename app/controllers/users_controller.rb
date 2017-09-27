class UsersController < ApplicationController
  before_action :set_user, except: [:register, :create]

  def register
    @user = User.new
  end

  def create
    @user = User.new(users_params)

    if @user.save
      flash[:notice] = "#{@user.username} was successfully created!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'register'
    end
  end

  def show
    @posts = @user.posts
    @comments = @user.comments
  end

  def edit
  end

  def update
    if @user.update(users_params)
      flash[:notice] = 'Your profile was updated!'
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def users_params
    params.require(:user).permit(:username, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
