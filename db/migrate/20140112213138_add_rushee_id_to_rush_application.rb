class AddRusheeIdToRushApplication < ActiveRecord::Migration
  def change
    add_column :rush_applications, :rushee_id, :integer
    add_index :rush_applications, :rushee_id, unique: true
  end
end
