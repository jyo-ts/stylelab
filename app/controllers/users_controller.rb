class UsersController < ApplicationController
  
  before_action :authenticate_user!, :only => [:show, :index, :edit, :update]

  def show
    @user = User.find(params[:id])
    if @user.id == current_user.id
      @entries = @user.entries.limit(7)
    else
      @room = Room.new
      @entry = Entry.new
    end
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params.require(:user).permit(:first_name, :last_name, :age, :salon_name, :salon_url, :profile, :image))
  end
  
  def following
    @user = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
end
