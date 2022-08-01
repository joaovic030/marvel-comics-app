# frozen_string_literal: true

require 'api_marvel'

module Marvel
  module ComicService
    def fetch_comics(params)
      client.comics(params)
    end

    def fetch_characters(params)
      client.characters(params)
    end

    def find_comic(id)
      client.comic(id)
    end

    private

    def client
      ApiMarvel.new.client
    end
  end
end
