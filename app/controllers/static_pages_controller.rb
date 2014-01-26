class StaticPagesController < ApplicationController
  before_action :set_email_to_rushee, only: [:rushee_mailer, :email_rushee]
  before_action :authenticate_vp_mem, only: [:rushee_mailer, :email_rushee]

  def home
  end

  def about
  end

  def careers
    @careerentries = CareerEntry.order(:year => :desc, :fullintern => :asc, :job_category => :asc, :name => :asc)
  end

  def contact
    @contact_request = ContactRequest.new
  end

  def consulting
  end

  def corporate
  end

  def rush
    @rushevents = RushEvent.order(:event_time => :asc)
    @rushflyer = RushFlyer.last
  end

  def classes
    @pledgeclasses = PledgeClassEntry.order(:year => :desc, :semester => :asc)
  end

  def contact_request
    @contact_request = ContactRequest.new(contact_params)
    if @contact_request.valid?
      ActiveMailer.contact_email(@contact_request).deliver
      flash[:success] = "You've successfully submitted your request to calakpsi.new@gmail.com. We will contact you back at #{@contact_request.email}."
      redirect_to contact_path
    else
      render 'contact'
    end
  end

  def rushee_mailer

  end

  def email_rushee
    if @email_to_rushee.valid?
      # IF Blast Email is Selected
      if params[:commit] == 'Blast Email'
        rushees = Rushee.all

        #Loop through all rushees to send the email
        rushees.each do |rushee|
          ActiveMailer.rushee_email(@email_to_rushee, rushee.email, rushee.name).deliver
        end
        flash[:success] = "Emails were successfully sent out to #{rushees.count} rushees."
        redirect_to rushee_mailer_url
      # IF Test Email is selected
      else
        vp_membership = Active.find_by(eboard: 'VP Membership')
        ActiveMailer.rushee_email(@email_to_rushee, vp_membership.email, vp_membership.name.titleize).deliver
        ActiveMailer.rushee_email(@email_to_rushee, 'rush@calakpsi.com', vp_membership.name.titleize).deliver
        flash[:notice] = "This email has been sent to rush@calakpsi.com and #{vp_membership.email}, please review it for errors."
        render 'rushee_mailer'
      end
    else
      render 'rushee_mailer'
    end
  end

  private

    def contact_params
      params.require(:contact_request).permit(:name, :email, :subject, :body)
    end

    def rushee_email_params
      params.require(:rushee_email).permit(:body, :subject)
    rescue
      nil
    end

    def set_email_to_rushee
      @email_to_rushee = RusheeEmail.new(rushee_email_params)
    rescue
      @email_to_rushee = RusheeEmail.new
    end

    def authenticate_vp_mem
      authenticate_active! && current_active.eboard = "VP Membership"
    end

end

