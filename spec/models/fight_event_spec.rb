require 'rails_helper'

RSpec.describe FightEvent, type: :model do
  let(:hero_one) { create(:hero, name: "winner", health: 100000, attack: 10000) }
  let(:hero_two) { create(:hero, name: "loser", health: 100, attack: 1) }
  let(:winner) { Fighter.create(hero: hero_one) }
  let(:loser) { Fighter.create(hero: hero_two) }
  let(:fight) { Fight.fight_between(winner, loser) }

  it "has a fight" do
    fight_event = fight.fight_events.first

    expect(fight_event.respond_to? :fight).to be(true)
  end
end
