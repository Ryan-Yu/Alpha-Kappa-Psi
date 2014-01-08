# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
AlphaKappaPsi::Application.initialize!

# Configure ActionMailer Settings, Overrides Devise's FROM setting
# Gmail does NOT allow spoofing of e-mail addresses
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => "587",
    :domain               => "gmail.com",
    :user_name            => "calakpsi.news@gmail.com",
    :password             => "inunityandintegrity",
    :authentication       => "plain",
    :enable_starttls_auto => true
}