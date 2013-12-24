class AddIndexToRusheesEmail < ActiveRecord::Migration

  def change
    add_index :rushees, :email, unique: true
  end
  
end
