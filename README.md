[![Gem Version](http://img.shields.io/gem/v/criteria_operator.svg?style=flat)](https://rubygems.org/gems/criteria_operator)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat)](http://TheFlow0360.mit-license.org)
[![Build Status](http://img.shields.io/travis/TheFlow0360/criteria_operator.svg?style=flat)](https://travis-ci.org/TheFlow0360/criteria_operator)
[![Dependency Status](http://img.shields.io/gemnasium/TheFlow0360/criteria_operator.svg?style=flat)](https://gemnasium.com/TheFlow0360/criteria_operator)
[![Code Climate](http://img.shields.io/codeclimate/github/TheFlow0360/criteria_operator.svg?style=flat)](https://codeclimate.com/github/TheFlow0360/criteria_operator)
[![Coverage Status](https://coveralls.io/repos/github/TheFlow0360/criteria_operator/badge.svg?branch=master)](https://coveralls.io/github/TheFlow0360/criteria_operator?branch=master)
[![Inline docs](http://inch-ci.org/github/TheFlow0360/criteria_operator.svg?branch=master&style=shields)](http://inch-ci.org/github/TheFlow0360/criteria_operator)
[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/958/badge)](https://bestpractices.coreinfrastructure.org/projects/958)


# CriteriaOperator

This gem provides classes to create arbitrary complex conditions, by building an expression tree. Currently only basic operations are implemented.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'criteria_operator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install criteria_operator

## Usage

For complete usage information, [read the docs](http://www.rubydoc.info/github/TheFlow0360/criteria_operator/master/frames)!

All relevant classes inherit from `BaseOperator`. Generally, you'll want to have a root node of this type, which will in turn contain the whole expression tree. Currently, there are the following operators:

### BinaryOperator

The `BinaryOperator` is the most commonly used. It represents a binary operation, meaning an operator with a left and right hand side operand, each. The operands can be any `BaseOperator`. The operator has to be one of the following types:
 - Equal *(default)*
 - Not Equal
 - Greater
 - Greater or Equal
 - Less
 - Less or Equal
 
 These types are represented by constants in the module `BinaryOperatorType`.
 
 Usage example:
 
     # checks if the operands op1 and op2 are different
     operator = CriteriaOperator::BinaryOperator.new op1, op2, CriteriaOperator::BinaryOperatorType::NOT_EQUAL


### GroupOperator

The `GroupOperator` is used to connect an amount of conditions (`BaseOperator`s) with either `AND` *(default)* or `OR` (see `GroupOperatorType`).

Usage example:

    # checks if any of the conditions represented by operands op1 through op3 is true
    operator = CriteriaOperator::GroupOperator.new [op1, op2, op3], CriteriaOperator::GroupOperatorType::OR


### UnaryOperator

The `UnaryOperator` is used to perform simple checks or transform a value represented by an operand (`BaseOperator`). It takes on operand as well and has one of the following types:
 - NOT *(default)*
 - IS NULL
 - Plus
 - Minus

These types can be found in the `UnaryOperatorType` module.

Usage example:

    # invert the sign of the result returned by operand op1
    operator = CriteriaOperator::UnaryOperator.new op1, CriteriaOperator::UnaryOperatorType::MINUS


### OperandProperty

The `OperandProperty` is, as the name implies, an operand. This means, it does not work with any other operands like operators do. If presented as a tree, operands always are leaves. The `OperandProperty` describes a property through it's name.

Usage example:

    # represents a column named 'integer_value' (without quotes)
    operand = CriteriaOperator::OperandProperty.new 'integer_value'


### OperandValue

The `OperandValue` is, just like the `OperandProperty`, an operand. It represents any kind of value.

Usage example:

    # represents the numeric value forty-two
    operand = CriteriaOperator::OperandValue.new 42

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/TheFlow0360/criteria_operator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

Prerequisite to the acceptance of any pull requests is a successful build (this will be checked automatically) as well as test coverage and complete documentation.  


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

