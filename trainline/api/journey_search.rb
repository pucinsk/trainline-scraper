# frozen_string_literal: true

require_relative "request"
require_relative "journey_search/request_body"

module Trainline
  module Api
    class JourneySearch
      include Request

      URL = "/api/journey-search/"

      def initialize(departure_id:, destination_id:, depart_at:)
        @departure_id = departure_id
        @destination_id = destination_id
        @depart_at = depart_at
      end

      def request
        self.class.post(URL, body: request_body.to_json)
      end

      private

      attr_reader :departure_id, :destination_id, :depart_at

      def request_body
        @request_body ||= RequestBody.new(departure_id:, destination_id:, depart_at:).to_h
      end
    end
  end
end
