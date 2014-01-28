class ChangeRusheepostsContentFormat < ActiveRecord::Migration
  
	def up
	    change_column :rusheeposts, :content, :text
	end
	def down
	    change_column :rusheeposts, :content, :string
	end
  
end
