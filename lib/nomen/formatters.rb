Dir[File.expand_path('../formatters/*.rb', __FILE__)].each {|file| require file }

class Nomen
  module Formatters
    class UnknownFormatterError < StandardError; end

    def self.lookup(type)
      begin
        const_get(type.to_s.split('_').map(&:capitalize).join)
      rescue NameError
        raise UnknownFormatterError, "unknown formatter '#{type}'"
      end
    end
  end
end
