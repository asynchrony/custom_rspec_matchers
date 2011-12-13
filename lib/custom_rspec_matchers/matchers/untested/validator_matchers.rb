module ValidatorMatchers
  def have_validation(attribute, validation_symbol)
    ValidatorMatcher.new(attribute, validation_symbol)
  end

  def validate_presence_of(attribute)
    ValidatorMatcher.new(attribute, :presence)
  end

  def validate_uniqueness_of(attribute)
    ValidatorMatcher.new(attribute, :uniqueness)
  end

  def validate_numericality_of(attribute)
    ValidatorMatcher.new(attribute, :numericality)
    end

  def validate_acceptance_of(attribute)
    ValidatorMatcher.new(attribute, :acceptance).accept('1')
  end

  def validate_length_of(attribute)
    ValidatorMatcher.new(attribute, :length)
  end

  class ValidatorMatcher
    def initialize(attribute, validation_symbol)
      @attribute = attribute
      @options = {}
      @validation_symbol = validation_symbol
      @validator_class_name = "#{validation_symbol.to_s.camelize}Validator"
    end

    def matches?(instance)
      @validation = instance.class.validators_on(@attribute).detect { |x| x.class == instance.class.const_get(@validator_class_name) }
      @validation && (@validation.options == @options)
    end

    def description
      " requires #{@validation_symbol} validator on #{@attribute} with options #{@options}"
    end

    def failure_message
      " expected #{@validation_symbol} validator on #{@attribute} with options #{@options} got options equal to #{@validation.options}"
    end

    def method_missing(method, args)
      @options.merge!(method.to_sym => args)
      self
    end
  end
end