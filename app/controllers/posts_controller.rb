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
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:content, :school_id)
  end


end
