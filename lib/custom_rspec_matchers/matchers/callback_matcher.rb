module CustomRspecMatchers
  module Matchers
    class CallbackMatcher
      attr_accessor :description
      attr_accessor :failure_message

      def initialize(kind, callback_on, method)
        @kind = kind
        @callback_on = callback_on
        @method = method
        @predicates = {}
        @description = "have #{@kind}_#{@callback_on} #{@method.inspect}"
      end

      def matches?(model)
        @actual = model.is_a?(Class) ? model : model.class
        @callbacks = model.send("_#{@callback_on}_callbacks")
        has_callbacks? and expected_method_in_callbacks? and @callbacks.any? { |cb| matches_predicates?(cb) }
      end

      def unless(predicate)
        predicates[:unless] = predicate
        self.description += ", :unless => #{predicate.inspect}"
        self
      end

      def if(predicate)
        predicates[:if] = predicate
        self.description += ", :if => #{predicate.inspect}"
        self
      end

      private
      attr_accessor :predicates

      def has_callbacks?
        @callbacks = @callbacks.find_all { |cb| cb.kind == @kind }
        @callbacks.size > 0 or fail "no #{@kind}_#{@callback_on} callbacks found"
      end

      def expected_method_in_callbacks?
        @callbacks = @callbacks.find_all { |cb| cb.raw_filter == @method }
        @callbacks.size > 0 or fail "#{@method.inspect} is not in #{@kind}_#{@callback_on} callbacks"
      end

      def matches_predicates?(callback)
        predicates.all? do |condition, expected_predicate|
          callback.options[condition].include?(expected_predicate) or fail "found #{condition.inspect} => #{callback.options[condition].inspect}"
        end
      end

      def fail(message)
        self.failure_message = "expected #{@actual.inspect} to #{description}\n\t but #{message}"
        false
      end

    end

    def have_after_validation_callback(method)
      CallbackMatcher.new(:after, :validation, method)
    end

    def have_before_validation_callback(method)
      CallbackMatcher.new(:before, :validation, method)
    end

    def have_after_validation_on_create_callback(method)
      CallbackMatcher.new(:after, :validation_on_create, method)
    end

    def have_before_validation_on_create_callback(method)
      CallbackMatcher.new(:before, :validation_on_create, method)
    end

    def have_after_validation_on_update_callback(method)
      CallbackMatcher.new(:after, :validation_on_update, method)
    end

    def have_before_validation_on_update_callback(method)
      CallbackMatcher.new(:before, :validation_on_update, method)
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
