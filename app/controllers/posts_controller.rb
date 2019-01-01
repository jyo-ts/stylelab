class PostsController < ApplicationController
  
  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.create(post_params)
    @user = User.find(@post.user_id)
    @post.save
    redirect_to "/posts"
  end
  
  def edit
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    if @post.user_id == current_user.id
    else
      redirect_to "/posts"
      flash[:alert] ="無効なユーザー"
    end
  end
  
  def update
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    if @post.user_id == current_user.id
      @post.update(params.require(:post).permit(:title, :content, {images: []}))
    else
      redirect_to "/posts"
      flash[:alert] ="無効なユーザー"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    if @post.user_id == current_user.id
      @post.destroy
    else
      redirect_to "/posts"
      flash[:alert] ="無効なユーザー"
    end
  end
  
  private 
    def post_params
      params.require(:post).permit(:title, :content, {images: []}).merge(:user_id => current_user.id)
    end
end
