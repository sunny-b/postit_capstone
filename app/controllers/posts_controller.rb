class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :edit]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = User.first

    if @post.save
      flash[:notice] = "New post successfully created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Your post was successfully updated!"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def new
    @post = Post.new
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit!
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
