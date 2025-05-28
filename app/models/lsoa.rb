require "net/http"
require "uri"

class Lsoa < ApplicationRecord
    def self.check(postcode)
        # Makes an API call to postcodes.io
        url = URI.parse("http://postcodes.io/postcodes/" + postcode)
        request = Net::HTTP::Get.new(url.to_s)
        response = Net::HTTP.start(url.host, url.port) { |http|
            http.request(request)
        }

        # Extracts the LSOA prefix
        json = JSON.parse(response.body, symbolize_names: true)
        if json[:status] != 200
            return false
        end
        lsoa_prefix = json[:result][:lsoa].rpartition(" ").first
        Lsoa.exists?(name: lsoa_prefix) # I am surprised and slightly appalled that this works without a 'return', but who am I to argue with RuboCop?
    end
end
