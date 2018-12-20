class UsersController < ApplicationController
  
  before_action :authenticate_user!, :only => [:show, :index, :edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params.require(:user).permit(:first_name, :last_name, :salon_name, :salon_url, :profile, :image))
  end
end
