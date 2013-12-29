ActiveAdmin.register Active do

  # Specify which columns we want to appear in our ActiveAdmin index page
  index do
    column :name
    column :email
    column :pledge_class
    column :major
    column :biography

    # Adds view/edit/delete actions
    default_actions
  end
  
  controller do
    def permitted_params
      params.permit!
    end
  end

end
