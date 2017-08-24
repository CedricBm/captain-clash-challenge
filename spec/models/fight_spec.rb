require 'rails_helper'

RSpec.describe Fight, type: :model do
  let(:winner) { create(:hero, name: "winner", health: 100000, attack: 10000) }
  let(:loser) { create(:hero, name: "loser", health: 100, attack: 1) }
  let(:fight) { Fight.fight_between(winner, loser) }

  it "has a winner, a loser and fight events" do
    expect(fight.respond_to? :winner).to be(true)
    expect(fight.respond_to? :loser).to be(true)
    expect(fight.respond_to? :fight_events).to be(true)
  end

  it "stores the heroes attributes correctly" do
    expect(eval(fight.winner_attributes)).to eq(winner.to_hash)
    expect(eval(fight.loser_attributes)).to eq(loser.to_hash)
  end
end
