require_relative 'test_helper'

class GroupOperatorTest < Minitest::Test

  def test_create_default
    op = CriteriaOperator::GroupOperator.new
    assert !op.nil?, 'Constructor returned nil!'
    assert_equal [], op.operand_collection
    assert_equal CriteriaOperator::GroupOperatorType::AND, op.operator_type
  end

  def test_create_parameterized
    operand = StubOperator.new
    operand.number = 42
    op = CriteriaOperator::GroupOperator.new [operand], CriteriaOperator::GroupOperatorType::OR
    assert !op.nil?, 'Constructor returned nil!'
    assert_kind_of StubOperator, op.operand_collection[0]
    assert_equal operand.number, op.operand_collection[0].number
    assert_equal CriteriaOperator::GroupOperatorType::OR, op.operator_type
  end

  def test_clone_not_abstract
    op = build_test_operator
    op.clone
  rescue NotImplementedError
    assert false, 'Abstract function clone is not implemented!'
  end

  def test_clone_correct_values
    op = build_test_operator
    op2 = op.clone
    assert !op2.nil?, 'Clone returned nil!'
    assert_kind_of CriteriaOperator::GroupOperator, op2
    assert_equal op.operand_collection.count, op2.operand_collection.count
    assert_equal op.operand_collection[0].number, op2.operand_collection[0].number
    assert_equal op.operand_collection[1].number, op2.operand_collection[1].number
    assert_equal op.operator_type, op2.operator_type
  end

  def test_clone_deep
    op = build_test_operator
    op2 = op.clone
    assert op != op2, 'Cloned operator is just a copied reference!'
    assert op.operand_collection != op2.operand_collection, 'Cloned Operator references the same operand collection!'
    assert op.operand_collection[0] != op2.operand_collection[0], 'Operand collection of cloned operator contains the same operand reference!'
    assert op.operand_collection[1] != op2.operand_collection[1], 'Operand collection of cloned operator contains the same operand reference!'
  end

  private

  def build_test_operator
    operand1 = StubOperator.new
    operand1.number = 42
    operand2 = StubOperator.new
    operand2.number = 1337
    CriteriaOperator::GroupOperator.new [operand2.clone, operand2.clone], CriteriaOperator::GroupOperatorType::AND
  end
end
