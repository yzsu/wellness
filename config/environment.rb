# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Wellness::Application.initialize!
ENV['RAILS_ENV'] ||= 'production'
