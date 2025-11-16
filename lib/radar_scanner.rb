class RadarScanner
  def initialize(radar, invaders, threshold: 80)
    @radar = radar
    @invaders = invaders
    @threshold = threshold
  end

  def scan
    @invaders.flat_map do |invader|
      Scanner.new(@radar, invader, threshold: @threshold).scan
    end
  end
end
