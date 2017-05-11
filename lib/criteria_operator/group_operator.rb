require 'criteria_operator/base_operator'

module CriteriaOperator

  # Enum representing all possible types for a {GroupOperator}.
  module GroupOperatorType
    # with this type, a {GroupOperator} will check that all grouped operands are true
    AND = 1
    # with this type, a {GroupOperator} will check that at least one of the grouped operands is true
    OR = 2
  end

  # Operator that groups multiple operators using one grouping type.
  class GroupOperator < BaseOperator

    # @return [GroupOperatorType] the type of this operator
    attr_accessor :operator_type

    # @return [Array<BaseOperator>] the collection of operands grouped by this operator
    attr_accessor :operand_collection

    # The constructor for this operator. Expects a collection of operands and the operator type as parameters.
    # @param [Array<BaseOperator>] operands a collection of operands to group together
    # @param [GroupOperatorType] group_operator_type the type of this operator
    # @return [Void]
    def initialize(operands = [], group_operator_type = GroupOperatorType::AND)
      self.operand = operands
      self.operator_type = group_operator_type
    end

    # Clones an operator with all sub-operators, creating a deep copy.
    # Implementation of the abstract {BaseOperator#clone}.
    # @return [GroupOperator] the cloned operator
    def clone
      ops = []
      self.operand_collection.each { |op| ops << clone_or_nil(op) }
      GroupOperator.new ops, self.operator_type
    end
  end
end
