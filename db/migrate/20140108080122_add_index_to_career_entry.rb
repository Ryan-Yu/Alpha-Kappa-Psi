class AddIndexToCareerEntry < ActiveRecord::Migration
  def change
    add_column :career_entries, :active_id, :integer
    remove_index :career_entries, :name =>'career_index'
    add_index :career_entries, [:active_id, :company, :year, :fullintern], :unique => true,
              :name => 'career_index'
  end
end
