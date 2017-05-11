require 'criteria_operator/base_operator'

module CriteriaOperator

  # Enum representing all possible types for a {UnaryOperator}.
  module UnaryOperatorType
    # with this type, a {UnaryOperator} will inverse the logical value of the operand
    NOT = 1
    # with this type, a {UnaryOperator} will check for if the operand equals null/nil
    IS_NULL = 2
    # with this type, a {UnaryOperator} will prepend a numerical positive sign to the operand
    PLUS = 4
    # with this type, a {UnaryOperator} will prepend a numerical negative sign to the operand
    MINUS = 8
  end

  # Operator representing and unary operation.
  class UnaryOperator < BaseOperator

    # @return [UnaryOperatorType] the type of this operator
    attr_accessor :operator_type

    # @return [BaseOperator] the operand
    attr_accessor :operand

    # The constructor for this operator. Expects the operand and the operator type as parameters.
    # @param [BaseOperator] operand the operand
    # @param [UnaryOperatorType] unary_operator_type the type of this operator
    # @return [Void]
    def initialize(operand = nil, unary_operator_type = UnaryOperatorType::NOT)
      self.operand = operand
      self.operator_type = unary_operator_type
    end

    # Clones an operator with all sub-operators, creating a deep copy.
    # Implementation of the abstract {BaseOperator#clone}.
    # @return [UnaryOperator] the cloned operator
    def clone
      UnaryOperator.new clone_or_nil(self.operand), self.operator_type
    end
  end
end
