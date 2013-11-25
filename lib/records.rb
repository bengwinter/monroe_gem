require './monroe'

module Monroe

  class Records

    def congressional_id(id)
      url = BASE_URI + "records?congress_id=" + id + "&api_key=" + Monroe.key
      return get(url)
    end

    def name(name)
      first_name = name.split(' ')[0]
      last_name = name.split(' ')[1]
      url = BASE_URI + "records?first_name=" + first_name + "&last_name" + last_name + "&api_key=" + Monroe.key
      return get(url)
    end

  end

end