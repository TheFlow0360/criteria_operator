require 'criteria_operator/exceptions'

module CriteriaOperator

  # Base class for all criteria operators. Provides operator overloads and other
  # useful utility and convenience functions.
  # @abstract Subclass and override {#clone} to implement.
  class BaseOperator

    # Clones an operator with all sub-operators, creating a deep copy.
    # @abstract
    # @return [BaseOperator] the cloned operator
    def clone
      raise NotImplementedError
    end

    protected

    # Clones the passed operator if it isn't nil.
    # @param [BaseOperator] op the operator to clone
    # @return [BaseOperator, nil] The cloned base operator, if it exists, or nil, otherwise.
    def clone_or_nil(op)
      return nil if op.nil? || !op.is_a?(BaseOperator)
      op.clone
    end
  end
end
