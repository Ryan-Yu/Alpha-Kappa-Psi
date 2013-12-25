class CreateRusheeposts < ActiveRecord::Migration
  def change
    create_table :rusheeposts do |t|
      t.string :content
      t.integer :active_id
      t.integer :rushee_id

      t.timestamps
    end

    # We expect to retrieve all the posts associated with a given
    # rushee_id in reverse order of creation
    add_index :rusheeposts, [:rushee_id, :created_at]
  end
end
