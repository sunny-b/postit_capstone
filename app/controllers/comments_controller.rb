class CommentsController < ApplicationController
  before_action :require_user, only: [:create]

  def create
    @comment = Comment.new(comments_params)
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @comment.creator = current_user

    if @comment.save
      flash[:notice] = "Comment created successfully!"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  private

  def comments_params
    params.require(:comment).permit!
  end
end
