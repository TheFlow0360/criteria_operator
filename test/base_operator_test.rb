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
end
