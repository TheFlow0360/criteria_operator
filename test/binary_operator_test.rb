require_relative 'test_helper'

class BinaryOperatorTest < Minitest::Test

  def test_create_default
    op = CriteriaOperator::BinaryOperator.new
    assert !op.nil?, 'Constructor returned nil!'
    assert_nil op.left_operand
    assert_nil op.right_operand
    assert_equal CriteriaOperator::BinaryOperatorType::EQUAL, op.operator_type
  end

  def test_create_parameterized
    operand1 = StubOperator.new
    operand1.number = 42
    operand2 = StubOperator.new
    operand2.number = 1337
    op = CriteriaOperator::BinaryOperator.new operand1.clone, operand2.clone, CriteriaOperator::BinaryOperatorType::NOT_EQUAL
    assert !op.nil?, 'Constructor returned nil!'
    assert_kind_of StubOperator, op.left_operand
    assert_equal operand1.number, op.left_operand.number
    assert_kind_of StubOperator, op.right_operand
    assert_equal operand2.number, op.right_operand.number
    assert_equal CriteriaOperator::BinaryOperatorType::NOT_EQUAL, op.operator_type
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
    assert_kind_of CriteriaOperator::BinaryOperator, op2
    assert_equal op.left_operand.number, op2.left_operand.number
    assert_equal op.right_operand.number, op2.right_operand.number
    assert_equal op.operator_type, op2.operator_type
  end

  def test_clone_deep
    op = build_test_operator
    op2 = op.clone
    assert op != op2, 'Cloned operator is just a copied reference!'
    assert op.left_operand != op2.left_operand, 'Cloned Operator references same left operand!'
    assert op.right_operand != op2.right_operand, 'Cloned Operator references same right operand!'
  end

  private

  def build_test_operator
    operand1 = StubOperator.new
    operand1.number = 42
    operand2 = StubOperator.new
    operand2.number = 1337
    CriteriaOperator::BinaryOperator.new operand1.clone, operand2.clone, CriteriaOperator::BinaryOperatorType::EQUAL
  end

end
