require_relative '../lib/scan_result'

RSpec.describe ScanResult do
  it "stores invader, coordinates and confidence correctly" do
    invader = double("Invader", name: "TestInvader")
    result = ScanResult.new(invader, 5, 3, "80")

    expect(result.invader).to eq(invader)
    expect(result.x).to eq(5)
    expect(result.y).to eq(3)
    expect(result.confidence).to eq("80")
  end
end
