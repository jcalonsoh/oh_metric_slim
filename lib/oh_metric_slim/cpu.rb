# Encoding: utf-8

require_relative '../../lib/oh_metric_slim/cpu/usage/darwin'
require_relative '../../lib/oh_metric_slim/cpu/usage/linux'

module OhMetricSlim
  class CPU_USAGE
    attr_reader :value

    def value
      @value ||= value_finder
    end

    def value_finder
      case Gem::Platform.local.os
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