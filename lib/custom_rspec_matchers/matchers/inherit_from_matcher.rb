module CustomRspecMatchers
  module Matchers
    class InheritFromMatcher
      def initialize(clazz)
        @clazz=clazz
      end
    
      def matches?(inheriting_instance)
        @inheriting_class = inheriting_instance.class.superclass
        @inheriting_class == @clazz
      end
    
      def description
        "inherit from #{@clazz}"
      end
    
      def failure_message
        " expected to inherit from #{@clazz} but was #{@inheriting_class}"
      end
    end
    
    def inherit_from(clazz)
      InheritFromMatcher.new(clazz)
    end
  end
end