# Encoding: utf-8

def darwin_value
  cpu = `top -l1 | awk '/CPU usage/'`
  cpu_usage = cpu.gsub(/[\,a-zA-Z:]/, "").split(" ")
  return cpu_usage[0].to_f
end
