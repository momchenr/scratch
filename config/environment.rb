# Load the rails application
require File.expand_path('../application', __FILE__)

# Environment Readiness
config.action_mailer.default_url_options = { :host => 'morning-river-4764.herokuapp.com' }

# Initialize the rails application
Scratch::Application.initialize!
