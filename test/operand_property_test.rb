require_relative 'test_helper'

class OperandPropertyTest < Minitest::Test

  def test_create_default
    assert_raises ArgumentError do
      CriteriaOperator::OperandProperty.new
    end
  end

  def test_create_parameterized
    op = CriteriaOperator::OperandProperty.new 'property'
    assert !op.nil?, 'Constructor returned nil!'
    assert_equal 'property', op.property_name
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
    assert_equal op.property_name, op2.property_name
  end

  private

  def build_test_operator
    CriteriaOperator::OperandProperty.new 'ColumnName'
  end
end
