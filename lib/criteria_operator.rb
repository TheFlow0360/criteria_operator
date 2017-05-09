require "criteria_operator/version"
require "criteria_operator/base_operator"

module CriteriaOperator
  def self.test
    puts "Working!"
  end

  class Error < StandardError; end
end
