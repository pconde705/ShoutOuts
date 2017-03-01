class LikesController < ApplicationController

  def create
    current_user.likes.create(post_id: params[:post_id])
    redirect_to posts_path
  end
end
