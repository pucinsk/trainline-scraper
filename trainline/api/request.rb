# frozen_string_literal: true

module Trainline
  module Api
    module Request
      DEFAULT_LOCALE = "en-GB"

      def self.included(base) # rubocop:disable Metrics/MethodLength
        require "httparty"

        base.include HTTParty
        base.base_uri "thetrainline.com"
        base.headers(
          {
            Accept: "application/json",
            "Accept-Language": "en-GB",
            "x-version": "4.33.27160",
            Host: "www.thetrainline.com",
            "User-Agent": "lpapp",
          },
        )
      end

      def object_blank?(res)
        !res || res.empty?
      end
    end
  end
end
