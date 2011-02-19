def have_before_destroy_callback(method)
  CallbackMatcher.new(:before, :destroy, method)
end