class FlagsController < ApplicationController

  def create
    current_user.flags.create(post_id: params[:post_id])
    @post = Post.find(params[:post_id])
    respond_to do |format|
      format.html { redirect_to posts_path }
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end

  end

end
