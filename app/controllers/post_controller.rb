class PostController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @posts = current_user.posts.new(post_params)
    if @posts.save
      respond_to do |format|
        format.js
      end
    else
      redirect_to new_user_post_path(params[:user_id])
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to user_path(params[:user_id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :author, :image, :private, :all_tags)
  end
end
