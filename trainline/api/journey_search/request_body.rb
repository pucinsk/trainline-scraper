# frozen_string_literal: true

module Trainline
  module Api
    class JourneySearch
      class RequestBody
        def initialize(departure_id:, destination_id:, depart_at:)
          @departure_id = departure_id
          @destination_id = destination_id
          @depart_at = depart_at
        end

        def to_h # rubocop:disable Metrics/MethodLength
          {
            passengers: [
              {
                id: "76f5ce86-6318-4d10-bb72-6779600357c9",
                dateOfBirth: DateTime.now.prev_year(18).strftime("%F"),
                cardIds: [],
              },
            ],
            isEurope: true,
            cards: [],
            transitDefinitions: [
              {
                direction: "outward",
                origin: departure_id,
                destination: destination_id,
                journeyDate: {
                  type: "departAfter",
                  time: depart_at.strftime("%FT%T"),
                },
              },
            ],
            type: "single",
            maximumJourneys: 10,
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

        private

        attr_reader :departure_id, :destination_id, :depart_at
      end
    end
  end
end
