class ChangeEventdescriptionFormatInRushEvents < ActiveRecord::Migration

	def up
	    change_column :rush_events, :event_description, :text
	end
	def down
	    change_column :rush_events, :event_description, :string
	end

end
