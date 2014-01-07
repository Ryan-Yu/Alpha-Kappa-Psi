ActiveAdmin.register Active do

  # Specify which columns we want to appear in our ActiveAdmin index page
  index do
    selectable_column
    column :name
    column :email
    column :pledge_class
    column :major
    column :hometown
    column :linkedin
    column :positions_held
    column :display_on_index

    # Adds view/edit/delete actions
    default_actions
  end

  # Specify which attributes we want the admin to be able to edit
  form do |f|
    f.inputs "Active information" do
      f.input :name
      f.input :email
      f.input :major
      f.input :pledge_class
      f.input :positions_held
      f.input :hometown
      f.input :biography
      f.input :linkedin
    end

    f.inputs "Appearance settings" do
      f.input :display_on_index
      f.input :photograph
    end
  
    f.actions
  end


  controller do
    def permitted_params
      params.permit!
    end
  end

end
