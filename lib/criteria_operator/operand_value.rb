require 'criteria_operator/base_operator'

module CriteriaOperator

  # Operator that holds a value. This operator is an operand,
  # thus it is always a leaf of the expression tree.
  class OperandValue < BaseOperator

    # @return the stored value.
    attr_accessor :value

    # @param [Object] value the value of the operand
    # @return [Void]
    def initialize(value)
      self.value = value
    end

    # Clones an operator with all sub-operators, creating a deep copy.
    # Since this is an operand, there are no sub-operators to clone.
    # Implementation of the abstract {BaseOperator#clone}.
    # @return [OperandValue] the cloned operator
    def clone
      OperandValue.new self.value
    end
  end
end
