require_relative "invader"

module InvadersHelper
  def self.load_all
    Dir["data/invaders/*.txt"].map do |path|
      name = File.basename(path, ".txt").capitalize
      Invader.from_text(File.read(path), name: name)
    end
  end
end