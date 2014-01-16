class ChangeExtracurricularFormatInRushApplications < ActiveRecord::Migration

	def up
	    change_column :rush_applications, :extracurricular_info, :text
	end
	def down
	    change_column :rush_applications, :extracurricular_info, :string
	end

end
