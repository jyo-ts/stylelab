class DropRelationships < ActiveRecord::Migration[5.2]
  def up
    drop_table :relationships
  end
  
  def down
    create_table "relationships", force: :cascade do |t|
    t.integer "follower"
    t.integer "followed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
  end
end
