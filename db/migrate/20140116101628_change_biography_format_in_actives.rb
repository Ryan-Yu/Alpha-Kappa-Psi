class ChangeBiographyFormatInActives < ActiveRecord::Migration
  
	def up
	    change_column :actives, :biography, :text
	end
	def down
	    change_column :actives, :biography, :string
	end

end
