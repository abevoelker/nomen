# -*- encoding: utf-8 -*-
require File.expand_path('../lib/nomen/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "nomen"
  s.version     = Nomen::VERSION
  s.authors     = ['Abe Voelker']
  s.email       = 'abe@abevoelker.com'
  s.homepage    = 'https://github.com/abevoelker/nomen'
  s.summary     = %q{Simple human name formatter}
  s.description = %q{Simple human name formatter}
  s.license     = 'MIT'

  s.add_development_dependency "bundler",    "~> 1.3"
  s.add_development_dependency "rspec",      "~> 2.14"
  s.add_development_dependency "rake",       "~> 10.1"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = ['test','spec','features'].map{|d| `git ls-files -- #{d}/*`.split("\n")}.flatten
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
