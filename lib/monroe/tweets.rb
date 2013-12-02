module Monroe

  module Tweets

    def self.congress_id(id)
      url = BASE_URI + "tweets?congress_id=" + id + "&api_key=" + Monroe.key
      return Monroe.get(url)
    end

    # def self.state(state)
    #   url = BASE_URI + "tweets?state=" + state + "&api_key=" + Monroe.key
    #   return Monroe.get(url)
    # end

    def self.name(name)
      first_name = name.split(' ')[0]
      last_name = name.split(' ')[1]
      url = BASE_URI + "tweets?first_name=" + first_name + "&last_name=" + last_name + "&api_key=" + Monroe.key
      return Monroe.get(url)
    end
  
  end

end