module CustomRspecMatchers
  module Matchers
    class CallbackMatcher
      def initialize(kind, callback_on, method)
        @kind = kind
        @callback_on = callback_on
        @method = method
      end
    
      def matches?(model)
        @callbacks = model.send("_#{@callback_on}_callbacks").find_all {|cb| cb.kind == @kind && cb.raw_filter == @method}
        @callbacks.size == 1
      end
    
      def description
        " has #{@kind}_#{@callback_on} callback on #{@method}"
      end
    
      def failure_message
        msg = " expected to have #{@kind}_#{@callback_on} callback on #{@method}"
      end
    end
    
    def have_after_create_callback(method)
      CallbackMatcher.new(:after, :create, method)
    end
    
    def have_before_create_callback(method)
      CallbackMatcher.new(:before, :create, method)
    end
    
    def have_around_create_callback(method)
      CallbackMatcher.new(:around, :create, method)
    end
    
    def have_after_save_callback(method)
      CallbackMatcher.new(:after, :save, method)
    end
    
    def have_before_save_callback(method)
      CallbackMatcher.new(:before, :save, method)
    end
    
    def have_around_save_callback(method)
      CallbackMatcher.new(:around, :save, method)
    end
    
    def have_after_update_callback(method)
      CallbackMatcher.new(:after, :update, method)
    end
    
    def have_before_update_callback(method)
      CallbackMatcher.new(:before, :update, method)
    end
    
    def have_around_update_callback(method)
      CallbackMatcher.new(:around, :update, method)
    end
  end
end