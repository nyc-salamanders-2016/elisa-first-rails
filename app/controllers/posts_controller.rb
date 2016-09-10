class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    require_user
  end

  def create
    require_user
    post = Post.new(post_params)
    if post.save
      redirect_to "/posts/#{post.id}"
    else
      @errors = post.errors.full_messages
      redirect_to '/posts/new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

   def post_params
     params.require(:post).permit(:title, :body, :user_id)
   end

end
