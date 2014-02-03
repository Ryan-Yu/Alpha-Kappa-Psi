ActiveAdmin.register Rushee do

  # Specify which columns we want to appear in our ActiveAdmin index page
  index do
    selectable_column
    column :name
    column :email
    column :major
    column :grade
    column :eliminated

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
      f.input :eliminated
    end
  
    f.actions
  end

  # Permit all attributes of Rushees to be edited
  controller do
    def permitted_params
      params.permit!
    end
  end

  #batch_action to eliminate rushee
  batch_action :eliminate, priority: 1 do |selection|
    Rushee.find(selection).each do |rushee|
      rushee.eliminated = true
      rushee.save
    end
    redirect_to :back
  end

  #batch_action to uneliminate rushee
  batch_action :uneliminate, priority: 2 do |selection|
    Rushee.find(selection).each do |rushee|
      rushee.eliminated = false
      rushee.save
    end
    redirect_to :back
  end
  
end
