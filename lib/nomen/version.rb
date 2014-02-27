module Nomen
  module Version
    MAJOR = '0'
    MINOR = '0'
    PATCH = '0'
  end
  VERSION = [Version::MAJOR, Version::MINOR, Version::PATCH].compact.join('.').freeze
end
