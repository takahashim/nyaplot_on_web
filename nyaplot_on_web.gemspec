# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nyaplot_on_web/version'

Gem::Specification.new do |spec|
  spec.name          = "nyaplot_on_web"
  spec.version       = NyaplotOnWeb::VERSION
  spec.authors       = ["takahashim"]
  spec.email         = ["maki@rubycolor.org"]

  spec.summary       = %q{Nyaplot exporter to web browser}
  spec.description   = %q{Nyaplot exporter to web browser}
  spec.homepage      = "https://github.com/takahashim/nyaplot_on_web"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "nyaplot"
  spec.add_dependency "launchy"
  spec.add_dependency "pry"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
