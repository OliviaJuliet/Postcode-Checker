class ServedPostcodesController < ApplicationController
    def index
    end

    # Ensures the entered text is in uppercase with no spaces, then checks ServedPostcode for it and asks Lsoa if it's in an allowed area.
    def check
        @sanitized_postcode = params[:query].delete(" ").upcase
        @served = ServedPostcode.exists?(postcode: @sanitized_postcode) || Lsoa.check(@sanitized_postcode)
    end
end
