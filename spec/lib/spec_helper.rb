$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'oh_metric_slim'
require 'simplecov'
# require 'coveralls'

# SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  # filters.clear # This will remove the :root_filter and :bundler_filter that come via simplecov's defaults
  # add_filter do |src|
  #   !(src.filename =~ /^#{SimpleCov.root}/) unless src.filename =~ /my_engine/
  # end
  add_filter '.gems'
end

# SimpleCov.minimum_coverage 60

# SimpleCov.at_exit do
#   SimpleCov.result.format!
# end

# Coveralls.wear_merged!
