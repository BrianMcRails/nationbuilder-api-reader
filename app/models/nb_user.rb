class NbUser < ActiveRecord::Base

#validates :external_id, :uniqueness => true

  def self.saveapi
    response =  HTTParty.get("https://brianmcauley.nationbuilder.com/api/v1/people?__nonce=adb0731da1b0cf4f6f230c898f8e746b3142a1157bcf9dd9745388f3bbe6358b&limit=10&__proto__=&access_token=adb0731da1b0cf4f6f230c898f8e746b3142a1157bcf9dd9745388f3bbe6358b",
        :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'})
      results = JSON.parse(response.parsed_response)['results']
      
      
      def format_results(results)
          results.map do |result| # change each -> map
              "\n\n#{ result['twitter_name'] }, #{ result['id'] }" # delete puts, [0]
  end.join # change to_sentence -> join

          text += format_results(results)
      end
      puts text
      #user_data = (@response.body)
     #@a = result.to_s[0]["twitter_name"]
     # users = user_data.map do |line|
    #  @u = NbUser.new
    #  @u.externalid.to_s = line['id']
    #  @u.lastname.to_s = line['twitter_name']
     #     puts @a
      # set name value however you want to do that
    #  @u.save
     # @u
    #end
   # users.select(&:persisted?)
  end

    
end
