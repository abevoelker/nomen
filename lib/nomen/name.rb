module Nomen
  class Name
    attr_accessor :first, :middle, :last, :suffix

    def initialize(opts={})
      name_opts = opts.select{|k,v| [:first, :middle, :last, :suffix].include?(k)}
      name_opts.each{|k,v| send("#{k}=".to_sym, v)}
      self
    end

    def format(type=:full)
      Nomen::Formatters.lookup(type).format(self)
    end

    def ==(other)
      [:first, :middle, :last, :suffix].each do |m|
        return false if self.send(m) != other.send(m)
      end
      true
    end

  end
end
