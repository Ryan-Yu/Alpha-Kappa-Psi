class CreateCareerEntries < ActiveRecord::Migration
  def change
    create_table :career_entries do |t|
      t.string :name
      t.string :company
      t.string :group
      t.integer :year
      t.string :full_or_intern
      t.string :location

      t.timestamps
    end
  end
end
