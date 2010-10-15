$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rspec'
require 'custom_rspec_matchers'
RSpec.configure do |config|
  config.include CustomRspecMatchers::Matchers
end
