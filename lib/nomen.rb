class Nomen
  FRAGMENTS = [:first, :middle, :last, :suffix]
  attr_accessor *FRAGMENTS

  def initialize(opts={})
    name_opts = opts.select{|k,v| FRAGMENTS.include?(k)}
    name_opts.each{|k,v| send("#{k}=".to_sym, v)}
    self
  end

  def format(type=:full)
    Nomen::Formatters.lookup(type).format(self)
  end

  def to_h
    FRAGMENTS.reduce({}){|a,f| a[f] = send(f); a}
  end

  def ==(other)
    FRAGMENTS.each{|m| return false if self.send(m) != other.send(m)}
    true
  end

end

require 'nomen/version'
require 'nomen/formatters'
