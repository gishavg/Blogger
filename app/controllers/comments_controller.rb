class CommentsController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
    respond_to do |format|
      format.js
    end
  end

  def new
  end

  def create
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.author = @user.first_name + @user.last_name
    if @comment.save
      redirect_to current_user
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to current_user
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
