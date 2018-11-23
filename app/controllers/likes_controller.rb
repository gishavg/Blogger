class LikesController < ApplicationController
  def create
    p params[:post_id]
  end

  def destroy
  end
end
