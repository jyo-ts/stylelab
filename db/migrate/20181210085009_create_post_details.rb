class CreatePostDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :post_details do |t|
      t.integer :post_id
      t.string :file_name
      t.string :file_type

      t.timestamps
    end
  end
end
