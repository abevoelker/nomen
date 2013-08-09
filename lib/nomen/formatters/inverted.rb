class Nomen
  module Formatters
    class Inverted

      def self.format(name)
        String.new.tap do |str|
          if name.last && !name.last.empty?
            if [name.first, name.middle, name.suffix].reject(&:nil?).reject(&:empty?).any?
              str << "#{name.last},"
            else
              str << name.last
            end
          end
          if name.first && !name.first.empty?
            str << (str.empty? ? name.first : " #{name.first}")
          end
          if name.middle && !name.middle.empty?
            str << (str.empty? ? name.middle : " #{name.middle}")
          end
          if name.suffix && !name.suffix.empty?
            str << (str.empty? ? name.suffix : " #{name.suffix}")
          end
        end
      end

    end
  end
end
