RSpec::Matchers.define :include_module do |expected|
  match do |actual|
    actual.included_modules.include? expected
  end

  failure_message_for_should do |actual|
    "Expected #{actual.name} to include the #{expected} module"
  end

  description do
    "includes the #{expected} module"
  end
end
