source 'https://rubygems.org'
ruby '2.0.0'
#ruby-gemset=railstutorial_rails_4_0

# Forem dependencies
gem 'forem', :github => "radar/forem", :branch => "rails4"
gem 'friendly_id', github: "FriendlyId/friendly_id"
gem 'cancan', git: "https://github.com/nukturnal/cancan.git"
gem 'kaminari', '0.15.0'
gem 'forem-theme-base', :github => 'radar/forem-theme-base'
gem 'forem-theme-twist', :github => 'radar/forem-theme-twist'
gem 'forem-bootstrap', :github => "radar/forem-bootstrap"
gem 'forem-textile_formatter'

# Heroku Add-Ons
gem 'unicorn'
gem 'newrelic_rpm'
gem 'dalli'

gem 'rails', '4.0.2'
gem 'devise'
gem 'faker', '1.1.2'

gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"
gem 'aws-sdk', '~> 1.5.7'

gem "therubyracer"
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"

gem 'activeadmin', github: 'gregbell/active_admin'
gem 'activesupport', "~> 4.0.2"

group :development, :test do
  gem 'sqlite3', '1.3.8'
  gem 'rspec-rails', '2.13.1'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
  gem 'factory_girl_rails', '4.2.1'
end

gem 'sass-rails', '4.0.1'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '4.0.1'
gem 'jquery-rails', '3.0.4'
gem 'turbolinks', '1.1.1'
gem 'jbuilder', '1.0.2'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end