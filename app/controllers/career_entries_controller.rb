class CareerEntriesController < ApplicationController

  before_action :authenticate_active!

  def create
    @careerentry = current_active.career_entries.build(career_params)
    @careerentry.name = current_active.name
    if safe_save(@careerentry)
      flash[:success] = "Your career has been created"
      redirect_to careers_path
    else
      flash.now[:error] = "The specified career already exists or something went wrong. Please try again."
      render 'new'
    end
  end

  def show
    @active = Active.find(params[:id])
    @activecareers = @active.career_entries.all
  end

  def destroy
    CareerEntry.find(params[:id]).destroy
    flash[:success] = "Career deleted."
    redirect_to career_entry_path(current_active)
  end

  def update
    @careerentry = CareerEntry.find(params[:id])
    if @careerentry.update_attributes(career_params)
      flash[:success] = "Career updated"
      redirect_to career_entry_path(current_active)
    else
      render 'edit'
    end

  end

  def new
    @careerentry = current_active.career_entries.build
  end

  def edit
    @careerentry = CareerEntry.find(params[:id])
  end

  def career_params
    params.require(:career_entry).permit(:name, :company, :year,
                                   :fullintern, :location, :job_category)
  end

  def safe_save(career_entry)
    begin
      career_entry.save!
      return true
    rescue Exception => e
      return false
    end
  end

end