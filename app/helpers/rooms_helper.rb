module RoomsHelper
  
  # 既読をつける
  def message_read(room_id)
    entry = Entry.where(room_id: room_id).where(user_id: current_user.id)
    entry.update(:read_status => "r")
  end
  

  
end
