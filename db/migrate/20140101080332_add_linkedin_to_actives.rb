class AddLinkedinToActives < ActiveRecord::Migration
  def change
    add_column :actives, :linkedin, :string
  end
end
