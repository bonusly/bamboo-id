# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bamboo_id/version'

Gem::Specification.new do |spec|
  spec.name          = "bamboo-id"
  spec.version       = BambooId::VERSION
  spec.authors       = ["Jon Evans"]
  spec.email         = ["joncodes@gmail.com"]

  spec.summary       = %q{Wrapper classes around the OpenID connect process.}
  spec.description   = %q{Easily connect your Ruby application to BambooHR through OpenID.}
  spec.homepage      = "https://www.github.com/bonusly/bamboo-id"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 2.2.18'
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock"

  spec.add_dependency 'httparty'
end
