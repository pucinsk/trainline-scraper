# frozen_string_literal: true

require "date"
require_relative "models/location"
require_relative "services/get_segments"

class ComThetrainline
  class << self
    def find(from, to, departure_at)
      raise ArgumentError, "departure_at must be a DateTime" unless departure_at.is_a?(DateTime)

      departure = Location.find_by_name(from)
      destination = Location.find_by_name(to)

      Services::GetSegments.run(departure:, destination:, depart_at: departure_at)
    end
  end
end
