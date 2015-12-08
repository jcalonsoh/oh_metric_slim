# Encoding: utf-8

require 'launchy'

module OhMetricSlim
  OS = Launchy::Application.new.host_os_family
end
