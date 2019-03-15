class MessagesController < ApplicationController
  
  def create
    logger.debug("================================= content = #{params[:message][:content]}")
    if Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :room_id, :content).merge(:user_id => current_user.id))
      redirect_to("/rooms/#{@message.room_id}")
    else
      flash[:alert] = "無効なユーザー"
      redirect_back(fallback_location:root_path)
    end
  end
end
