require_relative '../lib/radar'

RSpec.describe Radar do
  let(:radar_text) { "ooo\n-oo\n--o" }
  let(:radar) { described_class.from_text(radar_text) }

  it 'parses text into grid' do
    expect(radar.grid).to be_an(Array)
    expect(radar.grid.size).to eq(3)
    expect(radar.width).to eq(3)
  end

  it 'returns submatrix correctly' do
    sub = radar.window(0, 0, 2, 2)
    expect(sub).to eq([%w[o o], %w[- o]])
  end

  it 'returns nil if out of bounds' do
    expect(radar.window(3, 3, 2, 2)).to be_nil
  end
end
