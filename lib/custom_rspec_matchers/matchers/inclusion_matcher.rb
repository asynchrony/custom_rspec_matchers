class InclusionMatcher
  def initialize(modulez)
    @modulez=modulez
  end

  def matches?(including_instance)
    including_instance.kind_of?(@modulez)
  end

  def description
    "includes #{@modulez}"
  end

  def failure_message
    " expected to include #{@modulez} but did not"
  end
end

def include_module(modulez)
  InclusionMatcher.new(modulez)
end