require 'rspec'
require 'custom_rspec_matchers'

RSpec.configure do |config|
  config.include CustomRspecMatchers::Matchers
end