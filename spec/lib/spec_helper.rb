$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'simplecov'
require 'coveralls'

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter '.gems'
end

SimpleCov.minimum_coverage 60

SimpleCov.at_exit do
  SimpleCov.result.format!
end

Coveralls.wear!

require 'oh_metric_slim'
