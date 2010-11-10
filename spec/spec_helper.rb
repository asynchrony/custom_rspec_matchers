require 'rspec'
require 'custom_rspec_matchers'
require 'action_controller'


RSpec.configure do |config|
  config.include CustomRspecMatchers::Matchers
  config.include ActionController
  config.include ActiveModel
end

Dir.glob(File.dirname(__FILE__) + "/fixtures/**/*.rb").each {|f| require f}