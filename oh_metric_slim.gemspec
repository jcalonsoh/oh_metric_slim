# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'oh_metric_slim/version'

Gem::Specification.new do |spec|
  spec.name          = 'oh_metric_slim'
  spec.version       = OhMetricSlim::VERSION
  spec.authors       = ['Juan Carlos Alonso Holmstron']
  spec.email         = ['j.carlos.alonso.h@gmail.com']

  spec.summary       = 'This is one of many gem for the FW using Sensu App.'
  spec.description   = 'This is one of many gem for the FW using Sensu App.'
  spec.homepage      = 'https://github.com/jcalonsoh/oh_metric_slim'

  spec.files         = `git ls-files -z`.split("\x0") + `git ls-files --others --exclude-standard -z`.split("\x0")
  spec.executables   = ['oh-metricslim']
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib', 'lib/oh_metric_slim']

  spec.add_dependency 'thor', '~>  0.19', '>= 0'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop', '~> 0.35'
  spec.add_development_dependency 'aruba',  '~> 0.10'
  spec.add_development_dependency 'fakefs', '~> 0.6'
  spec.add_development_dependency 'web-console', '~> 2.0'
  spec.add_development_dependency 'spring', '~> 1.6'
  spec.add_development_dependency 'ruby-debug-ide', '~> 0.6'
end
