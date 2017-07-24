require 'criteria_operator/exceptions'

module CriteriaOperator

  # Base class for all criteria operators. Provides operator overloads and other
  # useful utility and convenience functions.
  # @abstract Subclass and override {#clone} to implement.
  class BaseOperator

    # Clones an operator with all sub-operators, creating a deep copy.
    # @abstract
    # @return [BaseOperator] the cloned operator
    def clone
      raise NotImplementedError
    end

    # Returns a string representation of the operator (including all sub-operators).
    # YAML is used for serialization.
    # @return [String] The serialized operator.
    def serialize
      BaseOperator.serialize(self)
    end

    # Returns a string representation of an operator (including all sub-operators).
    # YAML is used for serialization.
    # @param [BaseOperator] op The operator to serialize.
    # @return [String] The serialized operator.
    def self.serialize(op)
      YAML.dump(op)
    end

    # Deserializes an operator from a string.
    # String must be YAML-serialized.
    # @param [String] serialized_op The serialized operator.
    # @return [BaseOperator] The deserialized operator.
    def self.deserialize(serialized_op)
      YAML.safe_load(serialized_op, ObjectSpace.each_object(Class).select { |klass| klass < BaseOperator })
    end

    protected

    # Clones the passed operator if it isn't nil.
    # @param [BaseOperator] op The operator to clone.
    # @return [BaseOperator, nil] The cloned base operator, if it exists, or nil, otherwise.
    def clone_or_nil(op)
      return nil if op.nil? || !op.is_a?(BaseOperator)
      op.clone
    end
  end
end
