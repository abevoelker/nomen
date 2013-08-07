require 'rspec/autorun'
require 'nomen'

RSpec.configure do |config|
  # disable the "should" syntax (planned to be deprecated in RSpec 3.0)
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
