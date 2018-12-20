class AddDefaultToRooms < ActiveRecord::Migration[5.2]
  def change
    change_column_default :rooms, :name, '新規チャット'
    
    change_column_default :rooms, :explain, '説明はありません'
  end
end
