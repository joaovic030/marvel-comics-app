# frozen_string_literal: true

module Marvel
  module Response
    def formatted_response(response)
      case response.code
      when 200
        response['data']['results']
      else
        { code: response.code, status: response.status }
      end
    end
  end
end
