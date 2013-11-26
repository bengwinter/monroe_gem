require 'open-uri'
require 'json'

require 'monroe/articles'
require 'monroe/records'
require 'monroe/tweets'
require 'monroe/version'

module Monroe
  
  BASE_URI = 'http://political-sentiment.herokuapp.com/'

  class << self
    attr_accessor :key
    def configure
      yield self
    end
  end

  private

  def self.get(url)
    return JSON.parse(open(url.to_s).read).to_a[2][1]
  end

  class MonroeError < StandardError
  end

end
