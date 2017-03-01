class FlagsController < ApplicationController

  def create
    current_user.flags.create(post_id: params[:post_id])
    redirect_to posts_path
  end

end
