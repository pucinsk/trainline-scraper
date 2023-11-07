# frozen_string_literal: true

require_relative "request"

module Trainline
  module Api
    class JourneySearch
      include Request

      URL = "/api/journey-search"

      # def initialize(departure_id:, destination_id:, departure_at:)
      #   @departure_id = departure_id
      #   @destination_id = destination_id
      #   @departure_at = departure_at
      # end

      def post
        self.class.post(URL, body:, headers:, debug_output: STDOUT)
      end

      private

      def headers
        {
          "Content-Type": "application/json",
          "Content-Length": body.size.to_s,
          Connection: "keep-alive",
        }
      end

      def body
        @body ||= request_params.to_json
      end

      def request_params # rubocop:disable Metrics/MethodLength
        {
          passengers: [
            {
              id: "075c3b72-c343-4a3c-afd6-d9f64689cd03",
              dateOfBirth: "1996-11-07",
              cardIds: [],
            },
          ],
          isEurope: true,
          cards: [],
          transitDefinitions: [
            {
              direction: "outward",
              origin: "urn:trainline:generic:loc:182gb",
              destination: "urn:trainline:generic:loc:4916",
              journeyDate: {
                type: "departAfter",
                time: "2023-11-07T13:45:00",
              },
            },
          ],
          type: "single",
          maximumJourneys: 5,
          includeRealtime: true,
          transportModes: [
            "mixed",
          ],
          directSearch: false,
          composition: %w[
            through
            interchangeSplit
          ],
          requestedCurrencyCode: "EUR",
        }
      end
    end
  end
end
