require_relative '../lib/invader'

RSpec.describe Invader do
  let(:invader_text) { "--o---o---\n-oooo----\n--oo---o-" }
  let(:invader) { described_class.from_text(invader_text, name: "Alpha") }

  it 'parses text into pattern grid' do
    expect(invader.pattern.size).to eq(3)
    expect(invader.width).to eq(10)
    expect(invader.height).to eq(3)
  end

  it 'assigns a name' do
    expect(invader.name).to eq("Alpha")
  end
end
