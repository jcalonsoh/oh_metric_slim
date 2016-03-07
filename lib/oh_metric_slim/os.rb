# Encoding: utf-8
#
# Author: Juan Carlos Alonso (<j.carlos.alonso.holmstron@gmail.com>)

# @return [String] OS
module OhMetricSlim
  # This recover OS type system from rubygem
  # The value returns are aix|darwin|freebsd|hpux|linux|mingw32|openbsd|solaris
  # The values it will work darwin|linux|mingw32
  OS = Gem::Platform.local.os
end
