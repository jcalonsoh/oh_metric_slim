# Encoding: utf-8

module OhMetricSlim
  class cpu
    def value
      case Gem::Platform.local.os
        when /mswin|windows/i
          cpu = 'Data Unavailable'
        when /linux|arch/i
          cpu = 'Data Unavailable'
        when /sunos|solaris/i
          cpu = 'Data Unavailable'
        when /darwin/i
          cpu = `top -l1 | awk '/CPU usage/'`
          cpu = cpu.gsub(/[\,a-zA-Z:]/, "").split(" ")
          cpu[0].to_f
        else
          cpu = 'Data Unavailable'
      end
    end
  end
end