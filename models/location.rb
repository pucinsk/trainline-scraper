# frozen_string_literal: true

class Location
  attr_reader :code, :name

  def initialize(code:, name:)
    @code = code
    @name = name
  end

  class << self
    def find_by_name(name)
      response = Trainline::Api::Location.new(search_term: name)

      return unless response.success?

      location_data = response.body["searchLocations"][0]
      return if !location_data || location_data["name"] != name

      new(code: location_data["code"], name:)
    end
  end
end
