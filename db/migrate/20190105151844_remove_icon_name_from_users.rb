class RemoveIconNameFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :icon_name, :string
  end
end
