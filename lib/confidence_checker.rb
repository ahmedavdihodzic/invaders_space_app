class ConfidenceChecker
  def self.match(window, invader_edge)
    total = 0
    matches = 0

    window.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        total += 1
        matches += 1 if cell == invader_edge[y][x]
      end
    end

    return 0 if total == 0
    (matches * 100.0) / total
  end
end
