require 'prediction_io/async_methods'

module PredictionIO
  class Connection < ::ActiveResource::Base

    ##
    # TODO:
    # Add support to ssl authentications
    #

    ##
    # Extends amethods
    extend PredictionIO::AsyncMethods

    self.site     = PredictionIO::HOST
    self.timeout  = PredictionIO::TIMEOUT

    ##
    # Switches http for https
    #
    def self.set_https!
     self.site = self.site.to_s.sub!("http", "https")
    end

    ##
    # Appkey to be send with every request defined.
    def self.default_params
      { pio_appkey: PredictionIO::APPKEY }
    end


  end
end
