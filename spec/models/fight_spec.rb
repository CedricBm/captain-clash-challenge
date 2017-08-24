require 'rails_helper'

RSpec.describe Fight, type: :model do
  it "has a winner, a loser and fight events" do
    fight = build(:fight)

    expect(fight.respond_to? :winner).to be(true)
    expect(fight.respond_to? :loser).to be(true)
    expect(fight.respond_to? :fight_events).to be(true)
  end
end
