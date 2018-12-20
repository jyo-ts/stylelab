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
    @post = Post.create(params.require(:post).permit(:title, :content, :image_name, :user_id, :image).merge(:user_id => current_user.id))
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
    if @post.user_id == current_user
      @post.update(params.require(:post).permit(:title, :content, :image_name, :image))
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
end
