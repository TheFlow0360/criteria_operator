module CriteriaOperator

  # The base exception class for this gem.
  class Error < StandardError; end

  # Exception class for unimplemented functions in abstract classes.
  class NotImplementedError < Error

    # Overrides the default message with a hint regarding the abstract class instantiation.
    # @return [String] the error message
    def message
      'The function that was called is not implemented. '\
      'Probably the containing class is abstract but was instantiated.'
    end
  end
end
