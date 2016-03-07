require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'cucumber/rake/task'
require 'rubocop/rake_task'
require 'coveralls/rake/task'
require 'rake'

desc 'Run for Unit Tests'
RSpec::Core::RakeTask.new(:spec) do |task|
  task.pattern = Dir.glob('spec/**/*_spec.rb')
  task.rspec_opts = '--format documentation'
  task.rspec_opts << ' --color'
end

desc 'Run RuboCop on the lib directory'
RuboCop::RakeTask.new(:rubocop) do |task|
  task.patterns = ['lib/**/*.rb']
  # only show the files with failures
  task.formatters = ['files']
  # don't abort rake on failure
  task.fail_on_error = false
end

# desc 'Run Coverage Report'
# Coveralls::RakeTask.new(:test_with_coveralls) do
#   task [:spec, :features, 'coveralls:push']
# end

task default: :spec
