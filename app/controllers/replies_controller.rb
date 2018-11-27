class RepliesController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    @comment_id = params[:comment_id]
    @comments = @post.comments.find(params[:comment_id])

    respond_to do |format|
      format.js
    end
  end

  def new

  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.parent_id = params[:comment_id]
    @comment.author = current_user.first_name + current_user.last_name
    if @comment.save
      redirect_to current_user
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
