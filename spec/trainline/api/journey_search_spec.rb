# frozen_string_literal: true

require "spec_helper"
require_relative "../../support/webmock"
require_relative "../../../trainline/api/journey_search"
require_relative "../../../trainline/api/journey_search/request_body"
require_relative "../../../models/location"
require_relative "../../../services/log"

RSpec.describe Trainline::Api::JourneySearch do
  describe "#request" do
    subject(:request) { described_class.new(departure:, destination:, depart_at:) }

    let(:departure) { Location.new(code: "urn:trainline:generic:loc:182gb", name: "London") }
    let(:destination) { Location.new(code: "urn:trainline:generic:loc:4916", name: "Paris") }
    let(:depart_at) { DateTime.parse("2023-11-11 13:00:00") }
    let(:req_body) do
      Trainline::Api::JourneySearch::RequestBody.new(departure_id: departure.code, destination_id: destination.code,
                                                     depart_at:).to_h
    end

    before do
      stub_journey_search(req_body:, status:, body:)
    end

    context "when request is successful" do
      let(:status) { 200 }
      let(:body) { File.read("spec/fixtures/journey_search_response.json") }

      it { is_expected.to be_success }

      it "returns body with search data", :aggregate_failures do
        expect(request.body).to match(JSON.parse(body))
        expect(request.body["data"]["journeySearch"]).not_to be_nil
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
