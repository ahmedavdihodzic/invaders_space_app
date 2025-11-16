require_relative '../lib/confidence_checker'

RSpec.describe ConfidenceChecker do
  describe ".match" do
    it "returns 100 for perfect match" do
      window = [
        %w[X X],
        %w[X X]
      ]
      invader_edge = [
        %w[X X],
        %w[X X]
      ]

      expect(ConfidenceChecker.match(window, invader_edge)).to eq(100.0)
    end

    it "returns 50 for half match" do
      window = [
        %w[X .],
        %w[X .]
      ]
      invader_edge = [
        %w[X X],
        %w[X X]
      ]

      expect(ConfidenceChecker.match(window, invader_edge)).to eq(50.0)
    end

    it "returns 0 for no match" do
      window = [
        %w[. .],
        %w[. .]
      ]
      invader_edge = [
        %w[X X],
        %w[X X]
      ]

      expect(ConfidenceChecker.match(window, invader_edge)).to eq(0.0)
    end

    it "returns 0 if window is empty" do
      window = []
      invader_edge = []

      expect(ConfidenceChecker.match(window, invader_edge)).to eq(0)
    end
  end
end
