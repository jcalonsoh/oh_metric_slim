# Encoding: utf-8
#
# Author: Juan Carlos Alonso (<j.carlos.alonso.holmstron@gmail.com>)
#
# Get CPU Value from darwin systems
# @return [Float]

def darwin_value
  cpu = `top -l1 | awk '/CPU usage/'`
  cpu_usage = cpu.gsub(/[\,a-zA-Z:]/, '').split(' ')
  cpu_usage[0].to_f
end
