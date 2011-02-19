module CustomRspecMatchers
  module Matchers
    class HaveHelperMatcher
      def initialize(helper_module)
        @helper_module=helper_module
      end

      def matches?(controller_class)
        controller_class._helpers.include? @helper_module
      end

      def description
        "have helper #{@helper_module}"
      end

      def failure_message
        " expected to have helper #{@helper_module}"
      end
    end

    def have_helper(helper_module)
      HaveHelperMatcher.new(helper_module)
    end
  end
end