# frozen_string_literal: true

require 'marvel/connection'

module Marvel
  class Client
    include Marvel::Connection
    include Marvel::Methods
    include Marvel::Response

    attr_accessor :response

    def initialize
      @response = connection
    end

    private

    def send_request(endpoint, params = {})
      res = response.get(endpoint, params.merge(authorization))

      formatted_response(res.body)
    end
  end
end
