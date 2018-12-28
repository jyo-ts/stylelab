class MessagesController < ApplicationController
  
  def create
    @message = Message.create(params.require(:message).permit(:user_id, :room_id, :content).merge(:user_id => current_user.id))
    redirect_back(fallback_location:root_path)
  end
end
