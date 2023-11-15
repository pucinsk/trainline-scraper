# frozen_string_literal: true

require_relative "command"
require_relative "../trainline/api/journey_search"
require_relative "build_segments_from_api_response"

module Services
  class GetSegments
    extend Command

    def initialize(departure:, destination:, depart_at:)
      @departure = departure
      @destination = destination
      @depart_at = depart_at
    end

    def run
      if search_request.success?
        Services::BuildSegmentsFromApiResponse.run(search_data: search_request.body)
      else
        puts "API request has not been successful. Please check logs at tmp/app.log"
      end
    end

    private

    attr_reader :departure, :destination, :depart_at

    def search_request
      @search_request ||= ::Trainline::Api::JourneySearch.new(departure:, destination:, depart_at:)
    end
  end
end
