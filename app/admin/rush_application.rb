ActiveAdmin.register RushApplication do

  form do |f|
    f.inputs "Rush Application" do
      f.input  :name
      f.input  :phone_number
      f.input  :email
      f.input  :address
      f.input  :city
      f.input  :state
      f.input :zip_code
      f.input  :grade
      f.input  :first_major
      f.input :first_major_gpa, precision: 3,  scale: 2
      f.input  :second_major
      f.input :second_major_gpa, precision: 3,  scale: 2
      f.input  :third_major
      f.input :third_major_gpa, precision: 3,  scale: 2
      f.input  :minor
      f.input :cumulative_gpa, precision: 3, scale: 2
      f.input :intended_haas

      f.input  :academic_schedule
      f.input  :extracurricular_info

      f.input :cover_letter
      f.input :resume
      f.input :transcript
      f.input :additional_transcript
      f.input :photograph

      f.input :rushee_id
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
