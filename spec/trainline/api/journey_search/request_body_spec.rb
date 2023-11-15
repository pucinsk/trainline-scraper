# frozen_string_literal: true

require "spec_helper"
require "date"

require_relative "../../../../trainline/api/journey_search/request_body"

RSpec.describe Trainline::Api::JourneySearch::RequestBody do
  subject(:request_body) { described_class.new(departure_id:, destination_id:, depart_at:) }

  let(:departure_id) { "123def" }
  let(:destination_id) { "321qwe" }
  let(:depart_at) { DateTime.now }
  let(:eighteen_years_ago) { DateTime.now.prev_year(18) }

  describe "#to_h" do
    subject(:body) { request_body.to_h }

    it "returns request body with insterted values" do
      expect(body).to match(
        {
          passengers: [
            {
              id: "76f5ce86-6318-4d10-bb72-6779600357c9",
              dateOfBirth: eighteen_years_ago.strftime("%F"),
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
        },
      )
    end
  end
end
