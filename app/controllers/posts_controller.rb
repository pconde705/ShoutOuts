class PostsController < ApplicationController


  def index
    @posts = Post.order("id DESC")
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end


end
