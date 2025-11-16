class ScanResult
  attr_reader :invader, :x, :y, :confidence, :on_edge

  def initialize(invader, x, y, confidence, on_edge)
    @invader = invader
    @x = x
    @y = y
    @confidence = confidence
    @on_edge = on_edge
  end
end
