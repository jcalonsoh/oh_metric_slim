# Encoding: utf-8
#
# Author: Juan Carlos Alonso (<j.carlos.alonso.holmstron@gmail.com>)

require_relative '../../lib/oh_metric_slim/cpu/usage/darwin'
require_relative '../../lib/oh_metric_slim/cpu/usage/linux'

module OhMetricSlim
  # Used to recover cpu usage
  class CpuUsage
    # @return [Float] cpu value
    attr_reader :cpu_usage

    def self.cpu_usage
      @cpu_usage ||= value
    end

    def self.value
      case OhMetricSlim::OS
        # when /mswin|windows/i
        #   cpu = 'Data Unavailable'
      when /linux|arch/i
        return linux_value
        # when /sunos|solaris/i
        #   cpu = 'Data Unavailable'
      when /darwin/i
        return darwin_value
      end
    end
  end
end
