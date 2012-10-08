# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ap_command/version'

Gem::Specification.new do |gem|
  gem.name          = "ap_command"
  gem.version       = ApCommand::VERSION
  gem.authors       = ["sugamasao"]
  gem.email         = ["sugamasao@gmail.com"]
  gem.description   = %q{JSON file to awesome print for command line tool.}
  gem.summary       = %q{JSON file to awesome print for command line tool.}
  gem.homepage      = "https://github.com/sugamasao/ap_command"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('awesome_print')
  gem.add_development_dependency('rake')
  gem.add_development_dependency('rspec')
  gem.add_development_dependency('simplecov')
  gem.add_development_dependency('yard')
#  gem.add_development_dependency('redcarpet')
end
