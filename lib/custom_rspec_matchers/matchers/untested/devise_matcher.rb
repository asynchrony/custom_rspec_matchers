class DeviseModuleMatcher
  def initialize(included_module)
    @included_module=included_module
  end

  def matches?(inheriting_instance)
    @inheriting_instance = inheriting_instance
    inheriting_instance.devise_modules.include?(@included_module)
  end

  def description
    "include devise module #{@included_module}"
  end

  def failure_message
    " expected to include devise module #{@included_module} but not found in #{@inheriting_instance.devise_modules.join(", ")}"
  end
end

def include_devise_module(included_module)
  DeviseModuleMatcher.new(included_module)
end