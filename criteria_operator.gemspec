# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'criteria_operator/version'

Gem::Specification.new do |spec|
  spec.name          = "criteria_operator"
  spec.version       = CriteriaOperator::VERSION
  spec.authors       = ["Florian Koch"]
  spec.email         = ["floriankochde@arcor.de"]

  spec.summary       = "Provides objects to encapsulate arbitrary complex conditions."
  spec.description   = "This gem provides classes to create arbitrary complex chains respectively trees " \
                       "of conditions. This enables handling filter statements as objects."
  spec.homepage      = "https://github.com/TheFlow0360/criteria_operator.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org/"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-reporters", "~> 1.1"
  spec.add_development_dependency "coveralls", "~> 0.8"

  # let yard run on install
  spec.metadata["yard.run"] = "yri"
end
