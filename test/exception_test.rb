require_relative 'test_helper'

class ExceptionTest < Minitest::Test

  def test_not_implemented_message
    err = assert_raises CriteriaOperator::Error do
      raise CriteriaOperator::NotImplementedError
    end
    assert err.message.include?('abstract') && err.message.include?('not implemented'), "Exception message doesn't contain the necessary information"
  end

end