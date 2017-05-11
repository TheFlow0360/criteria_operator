require_relative 'test_helper'

class OperandValueTest < Minitest::Test

  def test_create_default
    assert_raises ArgumentError do
      CriteriaOperator::OperandValue.new
    end
  end

  def test_create_parameterized
    testHash = { number: 1337, string: 'forty-two' }
    op = CriteriaOperator::OperandValue.new testHash
    assert !op.nil?, 'Constructor returned nil!'
    assert_equal 1337, op.value[:number]
    assert_equal 'forty-two', op.value[:string]
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
    assert_equal op.value, op2.value
  end

  private

  def build_test_operator
    CriteriaOperator::OperandValue.new 42
  end
end
