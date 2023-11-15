# frozen_string_literal: true

require "date"
require_relative "command"
require_relative "../models/segment"

module Services
  class BuildSegmentsFromApiResponse
    extend Command

    def initialize(search_data:)
      @search_data = search_data["data"]
    end

    def run # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
      journeys.map do |journey|
        leg = legs[journey["legs"].first]
        Segment.new(
          departure_station: locations[leg["departureLocation"]]["name"],
          arrival_station: locations[leg["arrivalLocation"]]["name"],
          departure_at: DateTime.parse(leg["departAt"]),
          arrival_at: DateTime.parse(leg["arriveAt"]),
          service_agencies: carriers[leg["carrier"]]["name"],
          products: transport_modes[leg["transportMode"]]["mode"],
        )
      end
    end

    private

    attr_reader :search_data

    def journey_data = search_data["journeySearch"]
    def journeys = journey_data["journeys"].values
    def legs = journey_data["legs"]
    def locations = search_data["locations"]
    def carriers = search_data["carriers"]
    def transport_modes = search_data["transportModes"]
  end
end
