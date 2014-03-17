class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.integer :year
      t.string :members
      t.string :desc

      t.timestamps
    end
  end
end
