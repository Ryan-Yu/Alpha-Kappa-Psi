ActiveAdmin.register RushEvent do
  
  index do
    selectable_column
    column :event_name
    column :event_description
    column :location
    column :event_time
    column :semester

    # Adds view/edit/delete actions
    default_actions
  end


  form do |f|
    f.inputs "Rush event information - NOTE: make sure that all Rush Events listed are for the *same* rush semester (please delete rush events from previous semesters)" do
      f.input :event_name, :label => "Event name (i.e. 'Meet the Chapter')"
      f.input :event_description, :label => "Event description (be sure to include event dress code)"
      f.input :location
      f.input :event_time, :label => "Event starting time"
      f.input :semester, :label => "Rush semester (must be in the format [Semester] [Year]; i.e. Spring 2014)"
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