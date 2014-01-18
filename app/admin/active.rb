ActiveAdmin.register Active do

  # Specify which columns we want to appear in our ActiveAdmin index page
  index do
    selectable_column
    column :id
    column :name
    column :email
    column "Current executive board position, if applicable", :eboard
    column :pledge_class
    column :major
    column :hometown
    column :linkedin
    column :positions_held
    column :display_on_index
    column :approved
    column :forem_admin

    # Adds view/edit/delete actions
    default_actions
  end

  # Specify which attributes we want the admin to be able to edit
  form do |f|
    f.inputs "Active information" do
      f.input :id
      f.input :name
      f.input :email
      f.input :major
      f.input :pledge_class
      f.input :positions_held
      f.input :eboard, :label => "Current executive board position (leave blank if not on e-board)"
      f.input :hometown
      f.input :biography
      f.input :linkedin
    end

    f.inputs "Appearance settings" do
      f.input :approved
      f.input :display_on_index
      f.input :photograph
    end

    f.inputs "Administration permissions" do
      f.input :forem_admin
    end
  
    f.actions
  end


  controller do
    def permitted_params
      params.permit!
    end
  end

  #batch_action to activate users in ActiveAdmin Interface
  batch_action :activate, priority: 1 do |selection|
    Active.find(selection).each do |active|
      active.approved = true
      active.save
    end
    redirect_to :back
  end

  #batch_action to de-activate users in ActiveAdmin Interface
  batch_action :deactivate, priority: 2, confirm:"Are you sure you want to DE-ACTIVATE these actives?" do |selection|
    Active.find(selection).each do |active|
      active.approved = false
      active.display_on_index = false
      active.save
    end
    redirect_to :back
  end

  #batch_action to show active in brothers page
  batch_action :show, priority: 3 do |selection|
    Active.find(selection).each do |active|
      active.display_on_index = true
      active.save
    end
    redirect_to :back
  end

  #batch_action to hide active in brothers page
  batch_action :hide, priority: 4 do |selection|
    Active.find(selection).each do |active|
      active.display_on_index = false
      active.save
    end
    redirect_to :back
  end



end
