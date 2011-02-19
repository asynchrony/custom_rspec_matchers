RSpec::Matchers.define :have_mounted_uploader_for do |expected|
  match do |actual_instance|
    @actual_class = actual_instance.class
    debugger
    matches_column? and matches_uploader? and matches_mount_point?
  end

  failure_message_for_should do |actual|
    msg = "Expected to have an uploader for :#{expected} mounted on :#{expected_mount_point}"
    msg += " of type '#{@uploader_type}'" if @uploader_type
    msg += ", :#{expected} uploader not found" unless matches_column?
    msg += ", got uploader type '#{actual_uploader_type}'" unless matches_uploader?
    msg += ", but was mounted on :#{actual_mount_point} " unless matches_mount_point?
    msg
  end

  description do
    msg = "has an uploader for :#{expected} mounted on :#{@mounted_on}"
    msg += " of type '#{@uploader_type}'" if @uploader_type
    msg
  end

  chain :of_type do |uploader_type|
    @uploader_type = uploader_type
  end

  chain :mounted_on do |mounted_on|
    @mounted_on = mounted_on
  end

  define_method :matches_column? do
    @actual_class.uploaders.has_key?(expected)
  end

  define_method :matches_uploader? do
    !@uploader_type || actual_uploader_type == @uploader_type
  end

  define_method :matches_mount_point? do
    actual_mount_point == expected_mount_point
  end

  define_method :expected_mount_point do
    @mounted_on || default_mount_point
  end

  define_method :actual_mount_point do
    @actual_class.uploader_options[expected][:mount_on] || default_mount_point
  end

  define_method :default_mount_point do
    "#{expected}_filename"
  end

  define_method :actual_uploader_type do
    @actual_class.uploaders[expected]
  end
end