module EncodingCorrectlyFilter
  # EncodingCorrectlyFilter::InvalidEncodingError
  class InvalidEncodingError < ActionController::BadRequest
    def initialize(body)
      super("Invalid byte sequence in UTF-8: #{body}")
    end
  end
end
