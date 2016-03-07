# Encoding: utf-8
#
# Author: Juan Carlos Alonso (<j.carlos.alonso.holmstron@gmail.com>)
#
# Get CPU Value from Linux systems
# @return [Float]

def linux_value
  proc = '/proc/stat'
  first_measure = File.readlines(proc).grep(/^cpu /).first.split(' ')
  sleep 1
  second_measure = File.readlines(proc).grep(/^cpu /).first.split(' ')

  proc_usage_sum_0 = first_measure[1].to_i + first_measure[2].to_i + first_measure[3].to_i
  proc_usage_sum_1 = second_measure[1].to_i + second_measure[2].to_i + second_measure[3].to_i
  proc_usage = proc_usage_sum_1 - proc_usage_sum_0

  proc_total_0 = 0
  proc_total_1 = 0
  first_measure.each do |i|
    proc_total_0 += i.to_i
  end

  second_measure.each do |i|
    proc_total_1 += i.to_i
  end
  proc_total = (proc_total_1 - proc_total_0)

  (100 * (proc_usage.to_f / proc_total.to_f)).to_f.round(2)
end
