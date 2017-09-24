class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comments_params)
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @comment.creator = User.first

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
