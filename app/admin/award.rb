ActiveAdmin.register Award do

  
  index do
    selectable_column
    column :year
    column :members
    column :desc

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
