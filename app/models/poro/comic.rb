# frozen_string_literal: true

module Poro
  class Comic
    attr_accessor :all

    class << self
      include Marvel::ComicService

      def all(params = {})
        @all ||= fetch_comics(params)
      end

      def first(range = nil)
        all.first(range)
      end

      def last(range = nil)
        all.last(range)
      end
    end
  end
end
