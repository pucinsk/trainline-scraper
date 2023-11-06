# frozen_string_literal: true

require "spec_helper"
require "date"
require_relative "../com_thetrainline"

RSpec.describe ComThetrainline do
  describe ".find" do
    subject(:find_segments) { described_class.find(from, to, departure_at) }

    let(:from) { "London" }
    let(:to) { "Paris" }
    let(:departure_at) { DateTime.parse("2023-11-06 13:00:00") }

    it ".find method is defined" do
      expect { find_segments }.not_to raise_error
    end

    describe "departure_at" do
      it "accepts only instance of Datetime" do
        expect { find_segments }.not_to raise_error
      end

      context "when departure_at is not an instance of Datetime" do
        let(:departure_at) { "2023-11-06 13:00:00" }

        it "throws ArgumentError" do
          expect { find_segments }.to raise_error(ArgumentError, "departure_at must be a DateTime")
        end
      end
    end

    it "returns Array" do
      expect(find_segments).to be_a(Array)
    end
  end
end
