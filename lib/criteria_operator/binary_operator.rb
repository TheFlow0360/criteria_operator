require 'criteria_operator/base_operator'

module CriteriaOperator

  # Enum representing all possible types for a {BinaryOperator}.
  module BinaryOperatorType
    # with this type, a {BinaryOperator} will check for equality of both operands
    EQUAL = 1
    # with this type, a {BinaryOperator} will check for no equality of both operands
    NOT_EQUAL = 2
    # with this type, a {BinaryOperator} will check if the left operand is greater than the right operand
    GREATER = 4
    # with this type, a {BinaryOperator} will check if the left operand is greater than or equal to the right operand
    GREATER_OR_EQUAL = 8
    # with this type, a {BinaryOperator} will check if the left operand is less than the right operand
    LESS = 16
    # with this type, a {BinaryOperator} will check if the left operand is less than or equal to the right operand
    LESS_OR_EQUAL = 32
  end

  # Operator representing any of the binary conditionals defined in {BinaryOperatorType}.
  class BinaryOperator < BaseOperator

    # @return [BinaryOperatorType] the type of this operator
    attr_accessor :operator_type

    # @return [BaseOperator] the left hand side operand
    attr_accessor :left_operand

    # @return [BaseOperator] the right hand side operand
    attr_accessor :right_operand

    # @param [BaseOperator] left_operand the left hand side operand
    # @param [BaseOperator] right_operand the right  hand side operand
    # @param [BinaryOperatorType] binary_operator_type the type of this operator
    # @return [Void]
    def initialize(left_operand = nil, right_operand = nil, binary_operator_type = BinaryOperatorType::EQUAL)
      self.left_operand = left_operand
      self.right_operand = right_operand
      self.operator_type = binary_operator_type
    end

    # Clones an operator with all sub-operators, creating a deep copy.
    # Implementation of the abstract {BaseOperator#clone}.
    # @return [BinaryOperator] the cloned operator
    def clone
      BinaryOperator.new clone_or_nil(self.left_operand), clone_or_nil(self.right_operand), self.operator_type
    end
  end
end
