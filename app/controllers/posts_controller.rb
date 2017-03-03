class PostsController < ApplicationController

  def index
    type = params[:index_type]
    school = current_user.school
    @post = current_user.posts.new
    @posts = if params[:query].present?
        school.posts.search_by_content(params[:query])
      elsif type == 'SO'
        school.posts.where(is_shoutout: true).order("id DESC")
      elsif type == 'ASO'
        school.posts.where(is_antishoutout: true).order("id DESC")
      else
        school.posts.order("id DESC")
    end
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
