class Nomen
  module Formatters
    class Inverted

      def self.format(name)
        String.new.tap do |str|
          if name.last
            if [name.first, name.middle, name.suffix].reject(&:nil?).reject(&:empty?).any?
              str << "#{name.last},"
            else
              str << name.last
            end
          end
          if name.first
            str << (str.empty? ? name.first : " #{name.first}")
          end
          if name.middle
            str << (str.empty? ? name.middle : " #{name.middle}")
          end
          if name.suffix
            str << (str.empty? ? name.suffix : " #{name.suffix}")
          end
        end
      end

    end
  end
end
