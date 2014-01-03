class AddHometownToActives < ActiveRecord::Migration
  def change
    add_column :actives, :hometown, :string
  end
end
