ActiveAdmin.register PledgeClassEntry do

   # Specify which attributes we want the admin to be able to edit
  form do |f|
    f.inputs "Career entry information" do
      f.input :classname, :label => "Class Name (i.e. Alpha Epsilon)"
      f.input :semester, as: :select, collection: ["Fall", "Spring"], :label => "Semester"
      f.input :year
      f.input :members, :label => "Pledge Class Members (must separate with semicolons)"
      
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


