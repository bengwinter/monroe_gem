require_relative 'monroe/version'

require 'pry'
require 'net/http'
require 'open-uri'
require 'crack'

module Monroe
  BASE_URI = 'http://political-sentiment.herokuapp.com/'

  class << self
    attr_accessor :key
    def configure
      yield self
    end
  end

  class MonroeError < StandardError
  end
end
