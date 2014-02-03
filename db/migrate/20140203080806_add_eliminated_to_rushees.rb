class AddEliminatedToRushees < ActiveRecord::Migration
  def change
    add_column :rushees, :eliminated, :boolean, :default => false
  end
end
