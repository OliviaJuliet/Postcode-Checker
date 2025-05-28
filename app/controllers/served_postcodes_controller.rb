class ServedPostcodesController < ApplicationController
    def index
        @postcodes = ServedPostcode.all
    end

    def check
        @sanitized_postcode = params[:query].delete(" ").upcase
        @served = ServedPostcode.exists?(postcode: @sanitized_postcode) || Lsoa.check(@sanitized_postcode)
    end
end
