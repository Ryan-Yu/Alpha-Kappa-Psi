class AddDisplayOnIndexToActives < ActiveRecord::Migration
  def change
    add_column :actives, :display_on_index, :boolean
  end
end
