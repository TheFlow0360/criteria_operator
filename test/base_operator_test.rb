require_relative 'test_helper'

class BaseOperatorTest < Minitest::Test
  def setup
    @operator = CriteriaOperator::BaseOperator.new
  end

  def test_clone_abstract
    err = assert_raises CriteriaOperator::Error do
      @operator.clone
    end
    assert_kind_of CriteriaOperator::NotImplementedError, err
  end

  def test_serialize
    serialized_op = @operator.serialize
    assert !serialized_op.nil?, 'Serialization returned nil!'
    assert_kind_of String, serialized_op
    begin
      op = YAML.safe_load serialized_op, (ObjectSpace.each_object(Class).select { |klass| klass <= CriteriaOperator::BaseOperator })
    rescue
      assert false, 'Serialized operator couldn\'t be deserialized!'
    end
    assert_kind_of CriteriaOperator::BaseOperator, op
  end

  def test_deserialize
    serialized_op = YAML.dump(CriteriaOperator::OperandValue.new(42))
    op = CriteriaOperator::BaseOperator.deserialize(serialized_op)
    assert !op.nil?, 'Deserialization returned nil!'
    assert_kind_of CriteriaOperator::OperandValue, op
    assert_equal 42, op.value
  end

  def test_deserialize_fail
    serialized_obj = DateTime.new.to_yaml
    err = assert_raises Psych::Exception do
      CriteriaOperator::BaseOperator.deserialize(serialized_obj)
    end
    assert_kind_of Psych::DisallowedClass, err
  end
end
