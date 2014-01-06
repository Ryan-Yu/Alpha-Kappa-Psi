class AddJobCategoryToCareerEntries < ActiveRecord::Migration
  def change
    add_column :career_entries, :job_category, :string
  end
end
