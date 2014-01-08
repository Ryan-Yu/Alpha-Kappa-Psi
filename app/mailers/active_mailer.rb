#Acts like a controller and passes information on to its respective views
# Views are located in app/views/active_mailer/xxx_email
# Views are coded in HTML or TXT (plain text)
class ActiveMailer < ActionMailer::Base
  default from: "welcome@calakpsi.com"

  #Welcome email instance variables, uses a user, root_url
  # uses to: to send it to specified email and subject: for subject line.
  def welcome_email(user)
    @user = user
    @url = root_url
    mail(to: @user.email, subject: "#{user.name}, Welcome to Alpha Kappa Psi - Alpha Beta Chapter")
  end

  #Activation email instance variables
  def activation_email(user)
    @user = user
    @url = root_url
    mail(to: @user.email, subject: "You've been approved as an active at Alpha Kappa Psi - Alpha Beta Chapter")
  end
end
