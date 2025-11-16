require_relative "../lib/radar"
require_relative "../lib/invader"
require_relative "../lib/scanner"
require_relative "../lib/scan_result"
require_relative "../lib/confidence_checker"

RSpec.describe "Integration: Radar Scanner" do
  let(:radar_grid) do
    [
      %w[. . . . .],
      %w[. X X . .],
      %w[. X X . .],
      %w[. . . X X],
      %w[. . . X X]
    ]
  end

  let(:radar) { Radar.new(radar_grid) }

  let(:invader1_pattern) do
    [
      %w[X X],
      %w[X X]
    ]
  end

  let(:invader2_pattern) do
    [
      %w[X X],
      %w[X X]
    ]
  end

  let(:invader1) { Invader.new(invader1_pattern, name: "Alpha") }
  let(:invader2) { Invader.new(invader2_pattern, name: "Beta") }

  it "detects multiple invaders on the radar" do
    scanner1 = Scanner.new(radar, invader1, threshold: 100)
    scanner2 = Scanner.new(radar, invader2, threshold: 100)

    results1 = scanner1.scan
    results2 = scanner2.scan

    expect(results1).not_to be_empty
    expect(results2).not_to be_empty

    expect(results1.map { |r| [r.x, r.y] }).to include([1, 1])
    expect(results2.map { |r| [r.x, r.y] }).to include([3, 3])

    expect(results1.map(&:confidence)).to all(eq("100"))
    expect(results2.map(&:confidence)).to all(eq("100"))

    expect(results1 + results2).to all(be_a(ScanResult))
  end
end
