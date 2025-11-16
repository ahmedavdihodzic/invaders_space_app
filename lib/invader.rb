class Invader
  attr_reader :pattern, :width, :height, :name

  def initialize(pattern, name: 'Unknown Invader')
    @pattern = pattern
    @height = pattern.size
    @width = pattern.first.size
    @name = name
  end

  def self.from_text(text, name: 'Invader')
    new(text.lines.map { |line| line.chomp.chars }, name: name)
  end
end
