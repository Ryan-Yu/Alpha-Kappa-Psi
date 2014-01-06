ActiveAdmin.register CareerEntry do

  index do
    selectable_column
    column :name
    column :job_category
    column :company
    column :group
    column :location
    column :year
    column "Full-time/internship", :fullintern

    # Adds view/edit/delete actions
    default_actions
  end


  # Specify which attributes we want the admin to be able to edit
  form do |f|
    f.inputs "Career entry information" do
      f.input :name, :label => "Name of active/alumni"
      f.input :job_category, :label => "Job Category (i.e. Investment Banking; Technology)"
      f.input :company
      f.input :group, :label => "Group (i.e. 'Corporate Risk', 'Software Engineering') "
      f.input :location
      f.input :year
      f.input :fullintern, :label => "Full-time/internship (Must type either 'Full-time' or 'Internship') "
    end
  
    f.actions
  end

  
  # Permit all attributes of Rushees to be edited
  controller do
    def permitted_params
      params.permit!
    end
  end

end
