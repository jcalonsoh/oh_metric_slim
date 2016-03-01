$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'oh_metric_slim'
require 'simplecov'
require 'coveralls'
Coveralls.wear!

SimpleCov.start do
  add_group 'CPU', 'lib/oh_metric_slim_cpu'
  add_filter 'spec/'
end


