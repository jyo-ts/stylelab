class RoomsController < ApplicationController

  before_action :authenticate_user!, :only => [:create, :show, :index, :edit, :update, :destroy]
  
  def create
    @room = Room.create
    redirect_to "/rooms/#{@room.id}"
    flash[:notice] = "Let's talk！"
  end
  
  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
    @message = Message.new
  end
  
  def index
    @rooms = Room.all
  end
  
  def edit
    @room = Room.find(params[:id])
  end
  
  def update
    @room = Room.find(params[:id])
    @room.update(params.require(:room).permit(:name, :explain))
    flash[:notice] = "TalkRoomの情報が変更されました"
    redirect_back(fallback_location:root_path)
  end
  
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] ="TalkRoomを削除しました"
    redirect_to "/users/#{current_user.id}>"
  end
end
