# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
AlphaKappaPsi::Application.initialize!

# Configure ActionMailer Settings, Overrides Devise's FROM setting
# Gmail does NOT allow spoofing of e-mail addresses
ActionMailer::Base.delivery_method = :smtp

# Set Heroku environment variables with:
# heroku config:add EMAIL=myemail@gmail.com PASSWORD=PasswordShouldGoHere
ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => "587",
    :domain               => "gmail.com",
    :user_name            => "calakpsi.news@gmail.com",
    :password             => "1nun1ty@nd1ntegr1ty",
    :authentication       => "plain",
    :enable_starttls_auto => true
}