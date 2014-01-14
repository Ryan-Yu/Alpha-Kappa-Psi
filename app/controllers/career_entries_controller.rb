class CareerEntriesController < ApplicationController

  before_action :authenticate_active!, only: [:create, :destroy, :update, :new, :edit]
  before_action :correct_active, only: [:update, :edit, :destroy]

  def create
    @careerentry = current_active.career_entries.build(career_params)
    @careerentry.name = current_active.name
    if safe_save(@careerentry)
      flash[:success] = "Your career has been created!"
      # redirect_to active_career_entries_path(current_active)
      redirect_to current_active
    else
      flash.now[:error] = "The specified career already exists or something went wrong. Please try again."
      render 'new'
    end
  end

  def index
    @active = Active.find(params[:active_id])
    @activecareers = @active.career_entries.all
  end

  def destroy
    CareerEntry.find(params[:id]).destroy
    flash[:success] = "Career entry has been successfully deleted."
    # redirect_to active_career_entries_path(current_active)
    redirect_to current_active
  end

  def update
    @careerentry = CareerEntry.find(params[:id])
    if @careerentry.update_attributes(career_params)
      flash[:success] = "Career entry has been successfully updated."
      # redirect_to active_career_entries_path(current_active)
      redirect_to current_active
    else
      render 'edit'
    end

  end

  def new
    @active = current_active
    @careerentry = @active.career_entries.build
  end

  def edit
    @careerentry = CareerEntry.find(params[:id])
    @active = @careerentry.active
  end

  def career_params
    params.require(:career_entry).permit(:name, :company, :year,
                                   :fullintern, :location, :group, :job_category)
  end

  def safe_save(career_entry)
    begin
      career_entry.save!
      return true
    rescue Exception => e
      return false
    end
  end

  def correct_active
    @careerentry = current_active.career_entries.find(params[:id])
  rescue
    flash[:error] = "Sorry, you can only modify your own careers. Please notify VP Technology if there is an issue."
    redirect_to root_url
  end

end