class RenameFullorinternColumnToFullintern < ActiveRecord::Migration
  
	def self.up
	    rename_column :career_entries, :full_or_intern, :fullintern
	end

	def self.down
	    rename_column :career_entries, :fullintern, :full_or_intern
	end

end

