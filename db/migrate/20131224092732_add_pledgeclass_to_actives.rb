class AddPledgeclassToActives < ActiveRecord::Migration
  def change
    add_column :actives, :pledge_class, :string
  end
end
