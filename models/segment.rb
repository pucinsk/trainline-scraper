# frozen_string_literal: true

class Segment
  attr_reader :departure_station,
              :departure_at,
              :arrival_station,
              :arrival_at,
              :service_agencies,
              :products

  def initialize( # rubocop:disable Metrics/ParameterLists
    departure_station:,
    departure_at:,
    arrival_station:,
    arrival_at:,
    service_agencies:,
    products:
  )
    @departure_station = departure_station
    @departure_at = departure_at
    @arrival_station = arrival_station
    @arrival_at = arrival_at
    @service_agencies = service_agencies
    @products = products
  end

  def duration_in_minutes
    @duration_in_minutes ||= ((seg.arrival_at - seg.departure_at) / 60).numerator
  end
end
