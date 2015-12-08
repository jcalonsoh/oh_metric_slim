# Encoding: utf-8

require 'launchy'

module OhMetricSlim
  case Launchy::Application.new.host_os_family
    when /mswin|windows/i
      OS = 'Windows'
    when /linux|arch/i
      OS =  'Linux'
    when /sunos|solaris/i
      OS = 'Solaris'
    when /darwin|Darwin/i
      OS = 'MAC OS X'
    else
      OS = Gem::Platform.local.os
  end
end
