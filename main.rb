require_relative "lib/radar"
require_relative "lib/invader"
require_relative "lib/confidence_checker"
require_relative "lib/scan_result"
require_relative "lib/scanner"
require_relative "lib/radar_scanner"
require_relative "lib/invaders_helper"

radar_data = File.read("data/radar_sample.txt")

radar = Radar.from_text(radar_data)
invaders = InvadersHelper.load_all

scanner = RadarScanner.new(radar, invaders, threshold: 80)
results = scanner.scan

on_edge, not_on_edge = results.partition { |r| r.on_edge }

  
if results.empty?
  puts "No invaders detected."
else
  not_on_edge.each do |res|
    puts "- #{res.invader.name} (col:#{res.x}, row:#{res.y})," \
          "confidence:#{res.confidence} "
  end
  puts "Partially on view:"
  on_edge.each do |res|
    puts "- #{res.invader.name} (col:#{res.x}, row:#{res.y})," \
      "confidence:#{res.confidence} "
  end
end

