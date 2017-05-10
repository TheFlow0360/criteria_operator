require 'criteria_operator/base_operator'

module CriteriaOperator

  # Operator that stores a property (e.g. column name).
  # This operator is an operand, thus it is always a leaf of the expression tree.
  class OperandProperty < BaseOperator

    # @return the name of the property described by this operand.
    attr_accessor :property_name

    # @param [String] property_name the value of the operand
    # @return [Void]
    def initialize(property_name)
      self.property_name = property_name
    end

    # Clones an operator with all sub-operators, creating a deep copy.
    # Since this is an operand, there are no sub-operators to clone.
    # Implementation of the abstract {BaseOperator#clone}.
    # @return [OperandProperty] the cloned operator
    def clone
      OperandProperty.new self.value
    end
  end
end
