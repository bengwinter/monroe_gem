require_relative 'monroe'
module Monroe

  module Articles
    
    def self.query(options = {})
      begin
        api_key = "dcff0223e4322abd32a6638ad67854ec"
        congress_id = options[:congress_id].nil? ? "" : options[:congress_id]
        state = options[:state].nil? ? "" : options[:state]
        first_name = options[:first_name].nil? ? "" : options[:first_name]
        last_name = options[:last_name].nil? ? "" : options[:last_name]
        #limit = options[:limit].nil? ? "" : options[:limit]
        url = BASE_URI + "articles?congress_id=" + congress_id + "&state=" + state + "&first_name=" + first_name + "&last_name" + last_name + "&api_key=" + api_key #Monroe.key
        json_result = Crack::JSON.parse(open(url.to_s).read)
        return json_result
      rescue
        raise MonroeError
      end
  end

end

binding.pry