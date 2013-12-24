class AddBiographyToActives < ActiveRecord::Migration
  def change
    add_column :actives, :biography, :string
  end
end
