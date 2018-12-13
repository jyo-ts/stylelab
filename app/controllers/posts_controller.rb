class PostsController < ApplicationController
  
  def show
    @post = Post.find(params[:id])
    flash[:notice] = "投稿"
  end
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.create(params.require(:post).permit(:title, :content))
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
  end
  
  def destroy
  end
end
