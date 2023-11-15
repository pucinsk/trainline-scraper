# frozen_string_literal: true

require "spec_helper"
require_relative "../../support/webmock"
require_relative "../../../trainline/api/location"
require_relative "../../../services/log"

RSpec.describe Trainline::Api::Location do
  describe "#request" do
    subject(:request) { described_class.new(search_term:) }

    let(:search_term) { "London" }

    before do
      stub_locations_search(
        query: { searchTerm: "London", limit: described_class::DEFAULT_PAGE_SIZE,
                 locale: described_class::DEFAULT_LOCALE },
        status:,
        body:,
      )
    end

    context "when request is successful" do
      let(:status) { 200 }
      let(:body) { File.read("spec/fixtures/location_response.json") }

      it { is_expected.to be_success }

      it "returns body with search data", :aggregate_failures do
        expect(request.body).to match(JSON.parse(body))
        expect(request.body["searchLocations"]).not_to be_nil
        expect(request.body["searchLocations"][0]["name"]).to eq("London")
      end
    end

    context "when request is not successful" do
      let(:status) { 403 }
      let(:body) { "Something went wrong" }

      before do
        allow(Services::Log).to receive(:run)
      end

      it { is_expected.not_to be_success }

      it "does not return data" do
        expect(request.body).to be_nil
      end

      it "logs bad request" do
        request.success?
        expect(Services::Log).to have_received(:run).with(message: "Error@#{described_class.name}: #{body}")
      end
    end
  end
end
