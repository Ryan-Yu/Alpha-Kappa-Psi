class AddMajorToActives < ActiveRecord::Migration
  def change
    add_column :actives, :major, :string
  end
end
