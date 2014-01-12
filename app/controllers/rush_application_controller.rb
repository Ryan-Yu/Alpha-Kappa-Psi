class RushApplicationController < ApplicationController

  def index
    @rush_events = RushEvent.all
  end

  def create
    @rushee = Rushee.find_by(email: params[:rush_application][:email])
    @rushee_application = @rushee.build_rush_application(application_params(params[:rush_application]))
    if @rushee_application.save
      flash[:success] = "Your application has been successfully submitted!"
      redirect_to root_url
    else
      render action: 'new', :params => { email: params[:email], password: params[:password] }
    end
  end

  def new
    if !(params[:email].present? && params[:password].present?)
      flash.now[:notice] = "Please enter both credentials to access the rush application."
      render 'index'
      return
    end

    @rushee = Rushee.find_by(email: params[:email])
    if @rushee.nil?
      flash.now[:notice] = "This email has not yet been registered by a rushee. Please register at #{new_rushee_url}."
      render 'index'
    else
      if @rushee.authenticate(params[:password])
        @rushee_application = find_rush_application(@rushee.id)
        if @rushee_application.nil?
          @rushee_application = @rushee.build_rush_application
          @rushee_application.email = @rushee.email
          @rushee_application.name = @rushee.name
          @rushee_application.first_major = @rushee.major
          @rushee_application.grade = @rushee.grade
        end
        return
      else
        flash.now[:notice] = "The password you have entered is incorrect. Please try again."
        render 'index'
      end
    end
  end

  def application_params(params)
    params.permit(:email, :phone_number, :address, :city, :state, :country, :zip_code, :grade,
                                             :first_major, :first_major_gpa, :second_major, :second_major_gpa, :third_major,
                                             :third_major_gpa, :cumulative_gpa, :intended_haas,
                                             :academic_schedule, :extracurricular_info, :name,
                                             :cover_letter, :resume, :transcript, :additional_transcript, :photograph)
  end

  def find_rush_application(rushee_id)
    return RushApplication.find(rushee_id)
  rescue
    return nil
  end

end
