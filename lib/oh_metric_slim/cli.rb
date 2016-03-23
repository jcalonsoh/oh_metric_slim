# Encoding: utf-8

require 'thor'
require 'oh_metric_slim'

module OhMetricSlim
  # The command line runner for oh-metricslim.
  class CLI < Thor
    def initialize(*args)
      super
      $stdout.sync = true
    end

    desc 'version', "Print OH Metric slim's version information"
    def version
      puts "OH Metric slim version #{OhMetricSlim::VERSION}"
    end

    desc 'hello NAME', 'Display greeting with given NAME'
    def hello(name = nil)
      puts "Hello World! =), #{name}"
    end

    desc 'os', 'Look which OS you are standing'
    def os
      puts Gem::Platform.local.os
    end

    desc 'cpu', 'Will show the CPU % Used'
    def cpu
      value = OhMetricSlim::CpuUsage.value
      puts "It's being used #{value}"
    end
  end
end
