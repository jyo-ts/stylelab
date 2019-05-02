class AddStatusEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :read_status, :string
  end
end
