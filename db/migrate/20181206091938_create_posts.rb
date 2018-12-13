class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :user_id
      t.text :content
      t.string :image_name

      t.timestamps
    end
  end
end
