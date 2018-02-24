class ItemDoneChangeColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :done, :boolean, :default => false
  end
end
