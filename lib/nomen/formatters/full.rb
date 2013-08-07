module Nomen
  module Formatters
    class Full

      def self.format(name)
        String.new.tap do |str|
          if name.first
            str << name.first
          end
          if name.middle
            str << (str.empty? ? name.middle : " #{name.middle}")
          end
          if name.last
            str << (str.empty? ? name.last : " #{name.last}")
          end
          if name.suffix
            str << (str.empty? ? name.suffix : " #{name.suffix}")
          end
        end
      end

    end
  end
end
