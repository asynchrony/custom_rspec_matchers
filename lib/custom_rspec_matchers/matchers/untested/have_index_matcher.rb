RSpec::Matchers.define :have_index do |expected|
  match do |actual|
    matches_index?(actual) and matches_uniqueness?(actual)
  end

  failure_message_for_should do |actual|
    unless matches_uniqueness?(actual)
      "Expected #{actual.name} to #{description}, but index was not unique"
    else
      "Expected #{actual.name} to #{description}, got #{actual.index_options}"
    end
  end

  description do
    "have #{'unique ' if @should_be_unique}index for #{expected}"
  end

  chain :and_be_unique do
    @should_be_unique = true
  end

  define_method :matches_uniqueness? do |actual|
    !@should_be_unique or !actual.index_options[expected] or actual.index_options[expected][:unique]
  end

  define_method :matches_index? do |actual|
    actual.index_options.include?(expected)
  end
end
