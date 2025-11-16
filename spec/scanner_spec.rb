require_relative '../lib/scanner'

RSpec.describe Scanner do
  let(:radar_grid) do
    [
      %w[. . . .],
      %w[. X X .],
      %w[. X X .],
      %w[. . . .]
    ]
  end

  let(:invader_pattern) do
    [
      %w[X X],
      %w[X X]
    ]
  end

  let(:radar) { Radar.new(radar_grid) }
  let(:invader) { Invader.new(invader_pattern, name: "TestInvader") }

  it "detects invader correctly" do
    scanner = Scanner.new(radar, invader, threshold: 100)
    results = scanner.scan

    expect(results).to all(be_a(ScanResult))
    expect(results.map(&:x)).to include(1)
    expect(results.map(&:y)).to include(1)
    expect(results.map(&:invader).map(&:name)).to all(eq("TestInvader"))
    expect(results.map(&:confidence)).to all(eq("100"))
  end
end

