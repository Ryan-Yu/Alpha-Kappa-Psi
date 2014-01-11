#Acts like a controller and passes information on to its respective views
# Views are located in app/views/active_mailer/xxx_email
# Views are coded in HTML or TXT (plain text)
class ActiveMailer < ActionMailer::Base
  default from: "calakpsi.news@gmail.com"
  default to: "calakpsi.news@gmail.com"

  #Welcome email instance variables, uses a user, root_url
  # uses to: to send it to specified email and subject: for subject line.
  def welcome_email(user)
    @user = user
    @url = root_url
    mail(to: @user.email, subject: "[Alpha Kappa Psi] #{user.name}, Welcome to Alpha Kappa Psi - Alpha Beta Chapter")
  end

  #Activation email instance variables
  def activation_email(user)
    @user = user
    @url = root_url
    mail(to: @user.email, subject: "[Alpha Kappa Psi] You've been approved as an active at Alpha Kappa Psi - Alpha Beta Chapter")
  end

  #Contact Request Email
  def contact_email(contact_request)
    @contact_request = contact_request
    mail(subject: "[Contact Request] - #{@contact_request.name} - #{@contact_request.subject}", from: @contact_request.email)
  end

  #Rushee signup email
  def rushee_signup_email(rushee)
    @rushee = rushee
    @url = root_url
    @rush_events = RushEvent.all
    mail(to: @rushee.email, subject: "[Alpha Kappa Psi] Thank you for your interest in Alpha Kappa Psi")
  end

end
