# frozen_string_literal: true

require_relative "request"
require_relative "journey_search/request_body"

module Trainline
  module Api
    class JourneySearch
      include Request

      URL = "/api/journey-search/"

      def initialize(departure:, destination:, depart_at:)
        @departure = departure
        @destination = destination
        @depart_at = depart_at
      end

      def request
        self.class.post(URL, body: request_body.to_json)
      end

      private

      attr_reader :departure, :destination, :depart_at

      def request_body
        @request_body ||= RequestBody.new(departure_id: departure.code, destination_id: destination.code,
                                          depart_at:).to_h
      end
    end
  end
end
