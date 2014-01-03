class AddPositionsHeldToActives < ActiveRecord::Migration
  def change
    add_column :actives, :positions_held, :string
  end
end
