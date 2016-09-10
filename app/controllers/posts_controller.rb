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
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def edit
    require_user
    @post = Post.find(params[:id])
  end

  def update
    require_user
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    require_user
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private

   def post_params
     params.require(:post).permit(:title, :body, :user_id)
   end

end
