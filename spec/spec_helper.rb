require 'rspec'
require 'custom_rspec_matchers'
require 'action_controller'


RSpec.configure do |config|
  config.include CustomRspecMatchers::Matchers
  config.include ActionController
end