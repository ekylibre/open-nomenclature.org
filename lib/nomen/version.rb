module Nomen
  module Version
    MAJOR = '0'.freeze
    MINOR = '0'.freeze
    PATCH = '10'.freeze
  end
  VERSION = [Version::MAJOR, Version::MINOR, Version::PATCH].compact.join('.').freeze
end
