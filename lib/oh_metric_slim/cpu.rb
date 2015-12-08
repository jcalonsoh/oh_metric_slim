# Encoding: utf-8

module OhMetricSlim
  class CPU
    attr_reader :value

    def value
      @value ||= show
    end

    def show
      case Gem::Platform.local.os
        # when /mswin|windows/i
        #   cpu = 'Data Unavailable'
        # when /linux|arch/i
        #   cpu = 'Data Unavailable'
        # when /sunos|solaris/i
        #   cpu = 'Data Unavailable'
        when /darwin/i
          cpu = `top -l1 | awk '/CPU usage/'`
          cpu = cpu.gsub(/[\,a-zA-Z:]/, "").split(" ")
          puts cpu[0].to_f
        else
          puts 'Data Unavailable'
      end
    end

  end
end