ActiveAdmin.register Active do

  # Specify which columns we want to appear in our ActiveAdmin index page
  index do
    column :name
    column :email
    column :pledge_class
    column :major
    column :biography
    column :linkedin

    # Adds view/edit/delete actions
    default_actions
  end

  # Specify which attributes we want the admin to be able to edit
  form do |f|
    f.inputs "Profile Attributes" do
      f.input :name
      f.input :email
      f.input :major
      f.input :pledge_class
      f.input :biography
      f.input :linkedin
    end
  
    f.actions
  end


  controller do
    def permitted_params
      params.permit!
    end
  end

end
