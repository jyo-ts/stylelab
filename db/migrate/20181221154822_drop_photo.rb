class DropPhoto < ActiveRecord::Migration[5.2]
  def up
    drop_table :photos
  end
  
  def down
      create_table "photos", force: :cascade do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
