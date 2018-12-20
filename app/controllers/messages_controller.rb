class MessagesController < ApplicationController
  
  def create
    @message = Message.create(params.require(:message).permit(:user_id, :room_id, :content))
    redirect_back(fallback_location:root_path)
  end
end
