require "net/http"
require "uri"

class PostcodeApi
    def self.check(postcode)
        url = URI.parse("http://postcodes.io/postcodes/" + postcode)
        request = Net::HTTP::Get.new(url.to_s)
        response = Net::HTTP.start(url.host, url.port) { |http|
            http.request(request)
        }
        json = JSON.parse(response.body, symbolize_names: true)
        lsoa = json[:result][:lsoa]
        lsoa.start_with?("Southwark") || lsoa.start_with?("Lambeth") # I am surprised and slightly appalled that this works without a 'return', but who am I to argue with RuboCop?
    end
end
