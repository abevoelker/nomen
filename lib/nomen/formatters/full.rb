class Nomen
  module Formatters
    class Full

      def self.format(name)
        frags = [:first, :middle, :last, :suffix].map{|f| name.send(f)}
        frags.reject(&:nil?).reject(&:empty?).join(' ')
      end

    end
  end
end
