module CustomRspecMatchers
  module Matchers
    class CallbackMatcher
      def initialize(kind, callback_on, method)
        @kind = kind
        @callback_on = callback_on
        @method = method
      end
    
      def matches?(model)
        @callbacks = model.send("_#{@callback_on}_callbacks")
        if @type
          @callbacks = @callbacks.find_all {|cb| cb.kind == @kind}
        end
        @callbacks.any? {|cb| cb.raw_filter == @method}
      end
    
      def description
        " has #{@kind}_#{@callback_on} callback #{@method}"
      end
    
      def failure_message
        msg = " expected to have a #{@kind}_#{@callback_on} callback #{@method}"
        msg + " not found in #{@callbacks.map {|cb| {:method => cb.raw_filter, :type => cb.kind}}}"
      end
    end
    
    def have_after_create_callback(method)
      ActiveModelCallbackMatcher.new(:after, :create, method)
    end
    
    def have_before_create_callback(method)
      ActiveModelCallbackMatcher.new(:before, :create, method)
    end
    
    def have_around_create_callback(method)
      ActiveModelCallbackMatcher.new(:around, :create, method)
    end
    
    def have_after_save_callback(method)
      ActiveModelCallbackMatcher.new(:after, :save, method)
    end
    
    def have_before_save_callback(method)
      ActiveModelCallbackMatcher.new(:before, :save, method)
    end
    
    def have_around_save_callback(method)
      ActiveModelCallbackMatcher.new(:around, :save, method)
    end
    
    def have_after_update_callback(method)
      ActiveModelCallbackMatcher.new(:after, :update, method)
    end
    
    def have_before_update_callback(method)
      ActiveModelCallbackMatcher.new(:before, :update, method)
    end
    
    def have_around_update_callback(method)
      ActiveModelCallbackMatcher.new(:around, :update, method)
    end
  end
end