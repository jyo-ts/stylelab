class RenameTitreColumnToRelationships < ActiveRecord::Migration[5.2]
  def change
    rename_column :relationships, :follower, :follower_id
    rename_column :relationships, :followed, :following_id
  end
end
