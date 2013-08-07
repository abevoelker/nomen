require 'rspec/core/rake_task'
require 'rake/testtask'
require 'bundler'

Rake::TestTask.new(:spec) do |t|
  t.libs << ["lib", "spec"]
  t.pattern = "spec/**/*_spec.rb"
end

task :default => :spec

Bundler::GemHelper.install_tasks
