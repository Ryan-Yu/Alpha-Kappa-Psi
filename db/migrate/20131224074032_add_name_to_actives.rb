class AddNameToActives < ActiveRecord::Migration
  def change
    add_column :actives, :name, :string
  end
end
