class CreateRushees < ActiveRecord::Migration
  def change
    create_table :rushees do |t|
      t.string :name
      t.string :email
      t.string :grade
      t.string :major

      t.timestamps
    end
  end
end
