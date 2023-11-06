# frozen_string_literal: true

require "date"

class ComThetrainline
  class << self
    def find(_from, _to, departure_at)
      raise ArgumentError, "departure_at must be a DateTime" unless departure_at.is_a?(DateTime)

      []
    end
  end
end
