require 'rails_helper'

RSpec.describe FightEvent, type: :model do
  it "has a fight" do
    fight_event = build(:fight_event)

    expect(fight_event.respond_to? :fight).to be(true)
  end
end
