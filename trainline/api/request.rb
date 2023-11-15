# frozen_string_literal: true

require_relative "../../services/log"

module Trainline
  module Api
    module Request
      DEFAULT_LOCALE = "en-GB"

      def self.included(base) # rubocop:disable Metrics/MethodLength
        require "httparty"

        base.include HTTParty
        base.base_uri "https://www.thetrainline.com"
        base.headers(
          "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/119.0",
          Accept: "application/json",
          "Accept-language": DEFAULT_LOCALE,
          "Content-Type": "application/json",
          Host: "www.thetrainline.com",
          "Accept-Encoding": "deflate, gzip",
          "x-version": "4.34.27239",
        )
      end

      def success?
        response.code == 200
      end

      def body
        return @body if defined?(@body)

        @body = JSON.parse(response.body) if success?
      end

      def request
        raise StandardError, "#request is not implemented"
      end

      def response
        @response ||= begin
          Services::Log.run(message: "Error@#{self.class.name}: #{request.body}") unless request.code == 200
          request
        end
      end
    end
  end
end
