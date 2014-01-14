class AddEboardToActives < ActiveRecord::Migration
  def change
    add_column :actives, :eboard, :string, :default => ""
  end
end
