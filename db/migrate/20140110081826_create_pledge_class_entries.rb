class CreatePledgeClassEntries < ActiveRecord::Migration
  def change
    create_table :pledge_class_entries do |t|
      t.string :classname
      t.string :semester
      t.integer :year
      t.string :members

      t.timestamps
    end
  end
end
