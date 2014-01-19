class StaticPagesController < ApplicationController

  def home
  end

  def about
  end

  def careers
    @careerentries = CareerEntry.order(:year => :desc, :fullintern => :asc, :job_category => :asc)
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

  private

    def contact_params
      params.require(:contact_request).permit(:name, :email, :subject, :body)
    end

end

