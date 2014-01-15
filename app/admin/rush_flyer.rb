ActiveAdmin.register RushFlyer do
  
  menu :label => "Current Rush Flyer"
  index :title => "Current Rush Flyer (only one entry should exist)"


  form do |f|
    f.inputs "Flyer Front" do
      f.input :front, :label => "Front side"
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
