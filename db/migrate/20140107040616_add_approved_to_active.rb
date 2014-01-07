class AddApprovedToActive < ActiveRecord::Migration
  def self.up
    add_column :actives, :approved, :boolean, :default => false, :null => false
    add_index  :actives, :approved
  end

  def self.down
    remove_index  :actives, :approved
    remove_column :actives, :approved
  end
end