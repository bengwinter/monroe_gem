module Monroe

  module Records

    def self.congress_id(id)
      url = BASE_URI + "records?congress_id=" + id + "&api_key=" + Monroe.key
      return Monroe.get(url)
    end

    def self.name(name)
      first_name = name.split(' ')[0]
      last_name = name.split(' ')[1]
      url = BASE_URI + "records?first_name=" + first_name + "&last_name=" + last_name + "&api_key=" + Monroe.key
      return Monroe.get(url)
    end

  end

end