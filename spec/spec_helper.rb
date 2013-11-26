# require 'simplecov'
# require 'coveralls'

# SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
#   SimpleCov::Formatter::HTMLFormatter,
#   Coveralls::SimpleCov::Formatter
# ]
# SimpleCov.start

require 'monroe'

require 'rspec'
require 'webmock/rspec'
require 'json'

RSpec.configure do |config|
  config.order = 'random'
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

# Helper methods for accessing fixture path
def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

# Helper method for accessing a real file in the fixture path
def fixture(file)
  File.new(fixture_path + '/' + file)
end