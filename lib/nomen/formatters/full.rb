class Nomen
  module Formatters
    class Full

      def self.format(name)
        String.new.tap do |str|
          if name.first && !name.first.empty?
            str << name.first
          end
          if name.middle && !name.middle.empty?
            str << (str.empty? ? name.middle : " #{name.middle}")
          end
          if name.last && !name.last.empty?
            str << (str.empty? ? name.last : " #{name.last}")
          end
          if name.suffix && !name.suffix.empty?
            str << (str.empty? ? name.suffix : " #{name.suffix}")
          end
        end
      end

    end
  end
end
