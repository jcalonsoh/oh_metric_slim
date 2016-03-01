def linux_value
  first_measure = File.readlines('/proc/stat').grep(/^cpu /).first.split(' ')
  sleep 1
  second_measure = File.readlines('/proc/stat').grep(/^cpu /).first.split(' ')

  proc_usage_sum_0 = first_measure[1].to_i + first_measure[2].to_i + first_measure[3].to_i
  proc_usage_sum_1 = second_measure[1].to_i + second_measure[2].to_i + second_measure[3].to_i
  proc_usage = proc_usage_sum_1 - proc_usage_sum_0

  proc_total_0 = 0
  for i in (1..4) do
    proc_total_0 += first_measure[i].to_i
  end
  proc_total_1 = 0
  for i in (1..4) do
    proc_total_1 += second_measure[i].to_i
  end
  proc_total = (proc_total_1 - proc_total_0)

  cpu_usage = (proc_usage.to_f / proc_total.to_f)
  cpu_usage_percentage = (100 * cpu_usage).to_f.round(2)

  cpu_usage_percentage
end
