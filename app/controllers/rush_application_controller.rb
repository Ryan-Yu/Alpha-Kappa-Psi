class RushApplicationController < ApplicationController
  before_action :set_instance_variables, only: [:new, :create, :associate]

  def index
    @rush_events = RushEvent.all
  end

  #Safeguard agaisnt website crashes if people decide to manipulate URL
  def show
    flash[:error] = 'Please sign-in from the rush application portal to access your application.'
    redirect_to rush_application_index_path
  end

  #Controller logic for when a rushee submits credentials to signin to rush application
  def new
    if !(params[:email].present? && params[:password].present?)
      flash.now[:notice] = 'Please enter both credentials to access the rush application.'
      render 'index'
      return
    end

    if @rushee.nil?
      flash.now[:notice] = "This email has not yet been registered by a rushee. Please register at #{new_rushee_url}."
      render 'index'
    else
      unless @rushee.authenticate(params[:password])
        flash.now[:notice] = "The password you have entered is incorrect. Please try again."
        render 'index'
      end
    end
  end

  #Saves rush application to database or re-renders new
  def create
    #No Previous Rush Application
    if @rush_application.nil?
      @rush_application = @rushee.build_rush_application(application_params(params[:rush_application]))
      if @rush_application.save
        handle_submission(false, @rushee, @rush_application)
        return
      else
        render 'new'
        return
      end
      #Updating Previous Rush Application
    else
      if @rush_application.update_attributes(application_params(params[:rush_application]))
        handle_submission(true, @rushee, @rush_application)
        return
      else
        render 'new'
        return
      end
    end
  end

  # Associate an interview slot with a rushee
  def associate
    matchingSlots = InterviewSlot.where(start_time: DateTime.parse(params[:selected_slot]))

    # Iterate through all of the interview slots that have the same start_time as the one the rushee specified
    for index in 0 ... matchingSlots.size

      # We've found an InterviewSlot that we can place our rushee in
      if matchingSlots[index].rushee_id.nil?
        # Set our interview slot's rushee_id attribute to the rushee that was passed through
        matchingSlots[index].rushee_id = params[:rushee_id]

        # We've found a slot, and are saving it
        if matchingSlots[index].save
          flash.now[:success] = "You have successfully scheduled your professional interview, and should receive an email shortly with confirmation."
          ActiveMailer.interview_confirmation_email(Rushee.find(params[:rushee_id]), matchingSlots[index]).deliver
          render 'new'
          return
        end
      end

      if index == matchingSlots.size - 1
        # There should be an empty interview slot but there isn't (error)
        flash.now[:error] = "There was a problem processing your interview request. Please contact VP Membership at rush@calakpsi.com."
        render 'new'
        return
      end
    end
  end

  # Blank Method for Rendering Page
  def submitted

  end
  

  def print
    @rush_application = RushApplication.find(params[:id])
    @rushee = Rushee.find(@rush_application.rushee_id)
    if @rushee.password_digest != params[:confirmation]
      flash[:error] = 'Please sign-in from the rush application portal to access your application.'
      redirect_to rush_application_index_path
    end
  end

  # Helper Methods
  private

  def application_params(params)
    params.permit(:email, :phone_number, :address, :city, :state, :country, :zip_code, :grade,
                  :first_major, :first_major_gpa, :second_major, :second_major_gpa, :third_major,
                  :third_major_gpa, :cumulative_gpa, :intended_haas,
                  :academic_schedule, :extracurricular_info, :name,
                  :cover_letter, :resume, :transcript, :additional_transcript, :photograph)
  end

  def interview_slot_params
    params.permit(:start_time, :end_time, :interview_type)
  end

  #Gets the rush application associated with the rushee or nil if none is.
  def find_rush_application(rushee)
    return RushApplication.find_by(rushee_id: rushee.id)
  rescue
    nil
  end

  #Gets the rush application associated with the rushee or nil if none is.
  def find_interview_slot(rushee)
    return InterviewSlot.find_by(rushee_id: rushee.id)
  rescue
    nil
  end

  #Handles successful submission of application
  def handle_submission(updated, rushee, rush_app)
    flash.now[:success] = "Your application has been successfully submitted."
    if updated
      flash.now[:success] = "Your application has been successfully updated."
    end
    ActiveMailer.app_confirmation_email(updated, rushee, rush_app).deliver
    render 'submitted'
  end

  def set_instance_variables
    @available_slots = InterviewSlot.where(rushee_id: nil)

    if !params[:rush_application].nil?
      @rushee = Rushee.find(params[:rush_application][:rushee_id])
    elsif !params[:rushee_id].nil?
      @rushee = Rushee.find(params[:rushee_id])
    else
      @rushee = Rushee.find_by(email: params[:email])
    end

    unless @rushee.nil?
      @rush_application = find_rush_application(@rushee)

      if @rush_application.nil?
        @rush_application = @rushee.build_rush_application
        @rush_application.email = @rushee.email
        @rush_application.name = @rushee.name
        @rush_application.first_major = @rushee.major
        @rush_application.grade = @rushee.grade
      end
    end
  end

end
