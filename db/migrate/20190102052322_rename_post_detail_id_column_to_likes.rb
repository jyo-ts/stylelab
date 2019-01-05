class RenamePostDetailIdColumnToLikes < ActiveRecord::Migration[5.2]
  def change
    rename_column :likes, :post_detail_id, :post_id
  end
end
