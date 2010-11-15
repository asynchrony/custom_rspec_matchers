module CustomRspecMatchers
  module Matchers
    class FilterMatcher
      def initialize(filter_type, expected_filter)
        @filter_type = filter_type
        @expected_filter = expected_filter
        @options = {}
        @failure_message = ''
      end
    
      def description
        "include #{@filter_type.to_s} filter: #{@expected_filter}"
      end      
    
      def only_on(*only)
        @options = {:only => only}
        self
      end
    
      def except_on(*except)
        @options = {:except => except}
        self
      end
    
      def matches?(inheriting_instance)
        filter = inheriting_instance._process_action_callbacks.find_all { |x| x.kind == @filter_type && x.raw_filter == @expected_filter }.first
        if filter
          filter_matches(filter)
        else
          actual_filters = inheriting_instance._process_action_callbacks.find_all { |x| x.kind == @filter_type }.collect(&:filter)
          @failure_message = " expected to include #{@filter_type.to_s} filter #{@expected_filter} but not found in #{actual_filters}"
        end
        @failure_message.blank?
      end
    
      def filter_matches(filter)
        only_options_difference = options_difference_for_type(filter, :only)
        except_options_difference = options_difference_for_type(filter, :except)
        unless only_options_difference.empty? && except_options_difference.empty?
          @failure_message = "  #{@filter_type}_type: #{@expected_filter} was found but these differences exist:\n"
          unless only_options_difference.empty?
            @failure_message += "    expected only on actions '#{array_text @options[:only]}' but was on '#{array_text filter.options[:only]}'\n"
          end
          unless except_options_difference.empty?
            @failure_message += "    expected except on actions '#{array_text @options[:except]}' but was on '#{array_text filter.options[:except]}'\n"
          end
        end
      end
      
      def array_text(array)
        real_array = ([] << array).flatten.compact
        real_array.empty? ? '[]' : real_array
      end
      
      def options_difference_for_type(filter, option_type)
        actual_filter_options = ([] << filter.options[option_type]).flatten
        expected_filter_options = ([] << @options[option_type]).flatten
        actual_filter_options - expected_filter_options
      end
      
      def failure_message
        @failure_message
      end
    end
    
    def have_before_filter(expected_filter)
      FilterMatcher.new :before, expected_filter
    end

    def include_before_filter(expected_filter)
      RSpec.deprecate("include_before_filter","have_before_filter")
      have_before_filter(expected_filter)
    end  
    
    def have_after_filter(expected_filter)
      FilterMatcher.new :after, expected_filter
    end  
    
    def include_after_filter(expected_filter)
      RSpec.deprecate("include_after_filter","have_after_filter")
      have_after_filter(expected_filter)
    end  
  end
end
