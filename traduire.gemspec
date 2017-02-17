# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'traduire/version'

Gem::Specification.new do |spec|
  spec.name          = 'traduire'
  spec.version       = Traduire::VERSION
  spec.authors       = ['Josh Nussbaum']
  spec.email         = ['joshnuss@gmail.com']

  spec.summary       = %q{Utility for translating Rails apps}
  spec.description   = %q{Automate the process of localizing rails apps}
  spec.homepage      = "https://github.com/joshnuss/traduire"

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'TODO: Set to http://mygemserver.com'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
