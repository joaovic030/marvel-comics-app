# frozen_string_literal: true

module Poro
  class Comic
    attr_accessor :all

    LIMIT     = 100
    ORDER_BY  = '-onsaleDate'

    class << self
      include Marvel::ComicService

      attr_accessor :last_filter

      def all(params = {})
        params.merge!(default_params)

        if params != last_filter
          @last_filter = params

          @all = fetch_comics(params)
        else
          @all ||= fetch_comics(params)
        end
      end

      def first(range = nil)
        all.first(range)
      end

      def last(range = nil)
        all.last(range)
      end

      private

      def default_params
        { limit: LIMIT, orderBy: ORDER_BY }
      end
    end
  end
end
