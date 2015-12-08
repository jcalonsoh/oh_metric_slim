# Encoding: utf-8

module OhMetricSlim
  class cpu_used
    def show
      case Gem::Platform.local.os
        when /mswin|windows/i
          return 'Data Unavailable'
        when /linux|arch/i
          return 'Data Unavailable'
        when /sunos|solaris/i
          return 'Data Unavailable'
        when /darwin/i
          cpu = `top -l1 | awk '/CPU usage/'`
          cpu = cpu.gsub(/[\,a-zA-Z:]/, "").split(" ")
          cpu[0].to_f
        else
          return 'Data Unavailable'
      end
    end
  end
end