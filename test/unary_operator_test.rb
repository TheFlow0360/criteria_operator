require_relative 'test_helper'

class UnaryOperatorTest < Minitest::Test

  def test_create_default
    op = CriteriaOperator::UnaryOperator.new
    assert !op.nil?, 'Constructor returned nil!'
    assert_nil op.operand
    assert_equal CriteriaOperator::UnaryOperatorType::NOT, op.operator_type
  end

  def test_create_parameterized
    operand = StubOperator.new
    operand.number = 42
    op = CriteriaOperator::UnaryOperator.new operand, CriteriaOperator::UnaryOperatorType::IS_NULL
    assert !op.nil?, 'Constructor returned nil!'
    assert_kind_of StubOperator, op.operand
    assert_equal operand.number, op.operand.number
    assert_equal CriteriaOperator::UnaryOperatorType::IS_NULL, op.operator_type
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
    assert_kind_of CriteriaOperator::UnaryOperator, op2
    assert_equal op.operand.number, op2.operand.number
    assert_equal op.operator_type, op2.operator_type
  end

  def test_clone_deep
    op = build_test_operator
    op2 = op.clone
    assert op != op2, 'Cloned operator is just a copied reference!'
    assert op.operand != op2.operand, 'Cloned Operator references the same operand!'
  end

  private

  def build_test_operator
    operand = StubOperator.new
    operand.number = 42
    CriteriaOperator::UnaryOperator.new operand.clone, CriteriaOperator::UnaryOperatorType::NOT
  end
end
