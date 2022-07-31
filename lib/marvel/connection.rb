# frozen_string_literal: true

require 'rest-client'
require 'digest'

module Marvel
  module Connection
    URL = ENV.fetch('marvel_api', 'https://gateway.marvel.com/v1/public/')

    MARVEL_PUBLIC_KEY   = '07e3e205bebd46de31d15ee9a76d85c2'
    MARVEL_PRIVATE_KEY  = 'cb116416e7b6451df4226e110970d61e15dcf22f'

    def connection
      Faraday.new(options) do |conn|
        conn.response :json, parser_options: { object_class: OpenStruct }
        conn.adapter(Faraday.default_adapter)
      end
    end

    def options
      {
        url: URL,
        headers: headers,
        ssl: ssl,
        # params: params
      }
    end

    def authorization(tsz = Time.current.to_i.to_s)
      { ts: tsz, apikey: MARVEL_PUBLIC_KEY, hash: hash(tsz) }
    end

    def hash(tsz)
      Digest::MD5.hexdigest(tsz + MARVEL_PRIVATE_KEY + MARVEL_PUBLIC_KEY)
    end

    def headers
      {
        accept: 'application/json'
      }
    end

    def ssl
      { verify: false }
    end

    def params
      { orderBy: '-onsaleDate' }
    end
  end
end
