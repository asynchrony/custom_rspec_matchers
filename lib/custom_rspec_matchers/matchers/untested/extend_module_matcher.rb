module CustomRspecMatchers
  module Matchers
    class ExtendModuleMatcher
      def initialize(extended_module)
        @extended_module=extended_module
      end

      def matches?(klass)
        metaclass = class << klass
          self;
        end
        metaclass.include?(@extended_module)
      end

      def description
        "extend #{@extended_module}"
      end

      def failure_message
        " expected to extend #{@extended_module}"
      end
    end

    def extend_module(extended_module)
      ExtendModuleMatcher.new(extended_module)
    end
  end
end