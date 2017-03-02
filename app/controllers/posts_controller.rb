class PostsController < ApplicationController


  def index
    @posts = current_user.school.posts.order("id DESC")
    @post = current_user.posts.new
    # @posts = Post.order("id DESC")
    # @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    # @post = Post.new
    # @post.save
    if @post.save
      respond_to do |format|
        format.html { redirect_to posts_path(@post) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render :index }
        format.js  # <-- idem
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :school_id)
  end


end
