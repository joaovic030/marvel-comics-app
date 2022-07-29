# frozen_string_literal: true

module Marvel
  module Methods
    AVAILABLE_ENDPOINTS = ['comics'].freeze # put all marvel endpoints when needed

    # Just putting a little bit of metaprogramming (of course, a explicit declaration would be clearer to understand)
    # def endpoint_name(params)
    #   send_request(endpoint_name, params)
    # end
    AVAILABLE_ENDPOINTS.each do |endpoint|
      define_method(endpoint.to_sym) { |params = {}| send_request(endpoint, params) }
    end
  end
end
