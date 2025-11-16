require_relative '../lib/invaders_helper'

RSpec.describe InvadersHelper do
  describe ".load_all" do
    it "loads all invaders" do
      invaders = InvadersHelper.load_all
      expect(invaders).to all(be_a(Invader))
      expect(invaders).not_to be_empty
    end
  end
end
