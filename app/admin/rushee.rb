ActiveAdmin.register Rushee do

  # Specify which columns we want to appear in our ActiveAdmin index page
  index do
    selectable_column
    column :name
    column :email
    column :major
    column :grade

    # Adds view/edit/delete actions
    default_actions
  end

  form do |f|
    f.inputs "Rushee information" do
      f.input :name
      f.input :email
      f.input :major
      f.input :grade, as: :select, collection: ["Freshman", "Sophomore", "Junior", "Junior Transfer", "Senior"], :label => "Grade"
      f.input :photograph
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
