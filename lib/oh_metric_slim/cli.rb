# Encoding: utf-8
#
# Authors:: Juan Carlos Alonso (<juan_carlos_alonso_holmstron@gap.com>), Jose Ventura (<jose_ventura@gap.com>)
#
# Copyright 2014 Gap Inc.

require 'thor'
require 'launchy'
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
    def hello(name=nil)
      puts "Hello World! =), #{name}"
    end

    desc 'show os', "Look which OS you are standing"
    def showos
      puts Launchy::Application.new.host_os_family
    end
  end
end