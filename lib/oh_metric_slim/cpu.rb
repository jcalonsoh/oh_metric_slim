# Encoding: utf-8

module OhMetricSlim
  class CPU
    attr_reader :value

    def value
      @value ||= value_finder
    end

    def value_finder
      case Gem::Platform.local.os
        # when /mswin|windows/i
        #   cpu = 'Data Unavailable'
        when /linux|arch/i
          first_measure = File.readlines('/proc/stat').grep(/^cpu /).first.split(" ")
          sleep 1
          second_measure = File.readlines('/proc/stat').grep(/^cpu /).first.split(" ")

          @proc0usagesum = first_measure[1].to_i + first_measure[2].to_i + first_measure[3].to_i
          @proc1usagesum = second_measure[1].to_i + second_measure[2].to_i + second_measure[3].to_i
          @procusage = @proc1usagesum - @proc0usagesum

          @proc0total = 0
          for i in (1..4) do
            @proc0total += first_measure[i].to_i
          end
          @proc1total = 0
          for i in (1..4) do
            @proc1total += second_measure[i].to_i
          end
          @proctotal = (@proc1total - @proc0total)

          @cpuusage = (@procusage.to_f / @proctotal.to_f)
          @cpuusagepercentage = (100 * @cpuusage).to_f.round(2)
        # when /sunos|solaris/i
        #   cpu = 'Data Unavailable'
        when /darwin/i
          cpu = `top -l1 | awk '/CPU usage/'`
          cpu = cpu.gsub(/[\,a-zA-Z:]/, "").split(" ")
          cpu[0].to_f
      end
    end

  end
end