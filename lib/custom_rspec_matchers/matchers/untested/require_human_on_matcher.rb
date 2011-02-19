def require_human
  RequireHumanMatcher.new
end

class RequireHumanMatcher

  def matches?(instance)
    !instance.errors[:humanizer_answer].empty?
  end

  def description
    "required to be human"
  end
  
  def failure_message
    " expected to be human"
  end
end
