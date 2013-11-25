require 'net/http'
require 'open-uri'
require 'json'

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
