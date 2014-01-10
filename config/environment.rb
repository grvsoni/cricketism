# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Cricketism::Application.initialize!

my_datetime_formats = { :default => '%d-%b-%Y %H:%M' } #or any other you like
my_date_formats = { :default => '%d-%b-%Y' } #or any other you like

Time::DATE_FORMATS.merge!(my_datetime_formats)
Date::DATE_FORMATS.merge!(my_date_formats)

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}