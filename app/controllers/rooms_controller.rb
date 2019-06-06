class RoomsController < ApplicationController

  before_action :authenticate_user!, :only => [:create, :show, :index, :edit, :update, :destroy]
  
  def create
    @room = Room.create
    @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
    redirect_to "/rooms/#{@room.id}"
    flash[:notice] = "Let's talk！"
  end
  
  def show
    @room = Room.find(params[:id])
    if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location:root_path)
      flash[:alert] = "無効なユーザー"
    end
  end
  
  def index
    @entries = []
    Entry.order(read_status: :desc).where(user_id: current_user.id).each do |e|
      entry_id = Entry.where(room_id: e.room_id).where.not(user_id: current_user.id).ids
      @entries.push([e.room_id,Entry.find_by(id: entry_id).user_id])
    end  
    # @entries = current_user.entries.all.order(read_status: :desc)
    # logger.debug("=================index entries 相手のid = #{@entries[0][1]}")
  end
  
  def edit
    @room = Room.find(params[:id])
    if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
    else
      flash[:alert] = "無効なユーザー"
      redirect_back(fallback_location:root_path)
    end
  end
  
  def update
    @room = Room.find(params[:id])
    if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
      @room.update(params.require(:room).permit(:name, :explain))
      flash[:notice] = "TalkRoomの情報が変更されました"
      redirect_back(fallback_location:root_path)
    else
      flash[:alert] = "無効なユーザー"
      redirect_back(fallback_location:root_path)
    end
  end
  
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] ="TalkRoomを削除しました"
    redirect_to "/users/#{current_user.id}"
  end
end
