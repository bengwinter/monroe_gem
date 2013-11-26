module Monroe

  module Bill

    def self.number(number)
      url = BASE_URI + "bills?bill_number=" + number + "&api_key=" + Monroe.key
      return Monroe.get(url)
    end

  end

end