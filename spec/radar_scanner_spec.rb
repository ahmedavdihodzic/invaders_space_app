require_relative '../lib/radar_scanner'

RSpec.describe RadarScanner do
  let(:radar_text) do
    <<~RADAR
      ooo---ooo
      ooo---ooo
      ooo---ooo
    RADAR
  end

  let(:invader_text) do
    <<~INVADER
      oo
      oo
    INVADER
  end

  let(:radar) { Radar.from_text(radar_text) }
  let(:invader) { Invader.from_text(invader_text, name: "Square") }

  it 'scans with multiple invaders' do
    scanner = described_class.new(radar, [invader], threshold: 80)
    results = scanner.scan
    expect(results).not_to be_empty
    expect(results.first).to be_a(ScanResult)
  end
end
