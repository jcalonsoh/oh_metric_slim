# Encoding: utf-8

require 'launchy'
require 'oh_metric_slim'

module OhMetricSlim
  # The command line runner for oh-metricslim.
  class OS
    desc 'os', "Look which OS you are standing"
    def os
      Launchy::Application.new.host_os_family
    end
    desc 'show os', "Look which OS you are standing"
    def showos
      puts Launchy::Application.new.host_os_family
    end
  end
end