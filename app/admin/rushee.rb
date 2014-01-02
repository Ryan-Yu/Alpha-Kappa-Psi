ActiveAdmin.register Rushee do

  # Specify which columns we want to appear in our ActiveAdmin index page
  index do
    column :name
    column :email
    column :major
    column :grade

    # Adds view/edit/delete actions
    default_actions
  end

  # Permit all attributes of Rushees to be edited
  controller do
    def permitted_params
      params.permit!
    end
  end
  
end
