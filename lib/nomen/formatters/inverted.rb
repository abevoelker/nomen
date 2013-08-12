class Nomen
  module Formatters
    class Inverted

      def self.format(n)
        tail_str = [n.first, n.middle, n.suffix].reject{|f| (f || "").empty?}.join(' ')

        if (n.last || "").empty?
          tail_str.empty? ? "" : tail_str
        else
          tail_str.empty? ? n.last : "#{n.last}, #{tail_str}"
        end
      end

    end
  end
end
