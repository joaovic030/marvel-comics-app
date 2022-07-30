# frozen_string_literal: true

require 'api_marvel'

module Marvel
  module ComicService
    def fetch_comics(params)
      client = ApiMarvel.new.client

      client.comics(params)
    end
  end
end
