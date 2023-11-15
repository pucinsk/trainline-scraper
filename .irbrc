# frozen_string_literal: true

require_relative "com_thetrainline"
require_relative "trainline/api/location"
require_relative "trainline/api/journey_search"

require "date"
# rubocop:disable Lint/UselessAssignment
departure_id = "urn:trainline:generic:loc:182gb"
destination_id = "urn:trainline:generic:loc:4916"
depart_at = DateTime.parse("2023-11-20 13:00:00")
# rubocop:enable Lint/UselessAssignment
