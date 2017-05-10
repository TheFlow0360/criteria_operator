module CriteriaOperator

  # The base exception class for this gem.
  class Error < StandardError; end

  # Exception class for unimplemented functions in abstract classes.
  class NotImplementedError < Error
    # TODO: provide meaningful text
  end
end
