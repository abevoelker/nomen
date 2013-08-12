class Nomen
  module Formatters
    class Full

      def self.format(n)
        [n.first, n.middle, n.last, n.suffix].reject{|f| (f || "").empty?}.join(' ')
      end

    end
  end
end
