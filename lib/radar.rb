class Radar
  attr_reader :grid, :width, :height

  def initialize(grid)
    @grid = grid
    @height = grid.size
    @width  = grid.first.size
  end

  def self.from_text(text)
    new(text.lines.map { |line| line.chomp.chars })
  end

  def window(x, y, w, h)
    rows = grid[y...(y+h)]
    return nil unless rows && rows.size == h
    rows.map { |row| row[x...(x+w)] }
  end
end
