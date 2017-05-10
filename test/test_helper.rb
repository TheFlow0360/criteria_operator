$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'criteria_operator'

require 'minitest/autorun'
require 'minitest/reporters'
require 'coveralls'

MiniTest::Reporters.use!
Coveralls.wear!

# stub class for operators
class StubOperator < CriteriaOperator::BaseOperator
  attr_accessor :number

  def clone
    op = StubOperator.new
    op.number = number
    op
  end
end