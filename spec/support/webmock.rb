# frozen_string_literal: true

require "webmock/rspec"

def stub_locations_search(query:, status:, body:) # rubocop:disable Metrics/MethodLength
  stub_request(:get, "https://www.thetrainline.com/api/locations-search/v2/search")
    .with(
      query:,
      headers: {
        "Accept" => "application/json",
        "Accept-Encoding" => "deflate, gzip",
        "Accept-Language" => "en-GB",
        "Content-Type" => "application/json",
        "Host" => "www.thetrainline.com",
        "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/119.0",
        "X-Version" => "4.34.27239",
      },
    ).and_return(status:, body:)
end
