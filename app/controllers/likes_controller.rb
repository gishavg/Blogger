class LikesController < ApplicationController
  def create
    p params[:post_id]
    p params[:type]
    if params[:type] == "Post"
      @post = Post.find(params[:post_id])
    else
      @post = Comment.find(params[:post_id])
    end
    @like = @post.likes.new(:user_id => params[:user_id],
                      :likable_type => params[:type],
                       :likable_id => params[:post_id]
                     )
    if @like.save
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    if params[:type] == "Post"
      @post = Post.find(params[:post_id])
    else
      @post = Comment.find(params[:post_id])
    end
    like = Like.find_by(
       user_id: current_user.id,
       likable_type: params[:type],
       likable_id: params[:post_id],
     );
     p "===================================================destryed"
     Like.destroy(like.id);
     respond_to do |format|
       format.js
     end
  end
end
