module Nomen
  module Version
    MAJOR = '0'
    MINOR = '0'
    PATCH = '1'
  end
  VERSION = [Version::MAJOR, Version::MINOR, Version::PATCH].compact.join('.').freeze
end
