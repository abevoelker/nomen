class Nomen
  module Formatters
    class Inverted

      def self.format(name)
        String.new.tap do |str|
          tail_frags = [:first, :middle, :suffix].map{|f| name.send(f)}
          tail_str = tail_frags.reject(&:nil?).reject(&:empty?).join(' ')

          if name.last && !name.last.empty?
            str << (tail_str.empty? ? name.last : "#{name.last}, ")
          end
          str << tail_str unless tail_str.empty?
        end
      end

    end
  end
end
