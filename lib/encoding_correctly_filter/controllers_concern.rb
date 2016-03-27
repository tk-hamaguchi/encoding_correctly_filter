module EncodingCorrectlyFilter
  # EncodingCorrectlyFilter::ControllersConcern
  module ControllersConcern
    extend ActiveSupport::Concern

    protected

    # check_valid_encoding!
    def check_valid_encoding!
      [0xA5].each do |n|
        c = n.chr(Encoding::ASCII_8BIT)
        raise InvalidEncodingError, c if request.env['RAW_POST_DATA'].index(c)
      end
    end
  end
end
