# frozen_string_literal: true

require_relative "request"

module Trainline
  module Api
    class Location
      include Request

      URL = "/api/locations-search/v2/search"
      DEFAULT_PAGE_SIZE = 30

      attr_reader :search_term, :locale, :limit

      def initialize(search_term:, locale: DEFAULT_LOCALE, limit: DEFAULT_PAGE_SIZE)
        @search_term = search_term
        @locale = locale
        @limit = limit
      end

      def get
        return if object_blank?(resp) || object_blank?(resp["searchLocations"])

        resp["searchLocations"].detect { _1["name"].casecmp(search_term).zero? }
      end

      private

      def resp
        self.class.get(URL,
                       query: { searchTerm: search_term, locale:, limit: })
      end
    end
  end
end
