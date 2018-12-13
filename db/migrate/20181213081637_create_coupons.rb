class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.integer :stylist_id
      t.string :title
      t.text :content
      t.date :expired_date
      t.integer :max_number

      t.timestamps
    end
  end
end
