class CreateCouponOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :coupon_orders do |t|
      t.integer :coupon_id
      t.integer :user_id

      t.timestamps
    end
  end
end
