lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kitchen/driver/orbstack_version"

Gem::Specification.new do |spec|
  spec.name          = "kitchen-orbstack"
  spec.version       = Kitchen::Driver::ORBSTACK_VERSION
  spec.authors       = ["Martin Fedec"]
  spec.email         = ["martin.fedec@gmail.com"]
  spec.description   = "A Test Kitchen Driver for OrbStack"
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/mfedec/kitchen-orbstack"
  spec.license       = "Apache-2.0"

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR).grep(/LICENSE|^lib/)
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 3.1"

  spec.add_dependency "test-kitchen", ">= 1.4.1", "< 4"
end