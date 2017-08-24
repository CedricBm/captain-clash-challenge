require 'rails_helper'

RSpec.describe FightEvent, type: :model do
  let(:winner) { create(:hero, name: "winner", health: 100000, attack: 10000) }
  let(:loser) { create(:hero, name: "loser", health: 100, attack: 1) }
  let(:fight) { Fight.fight_between(winner, loser) }

  it "has a fight" do
    fight_event = fight.fight_events.first

    expect(fight_event.respond_to? :fight).to be(true)
  end
end
