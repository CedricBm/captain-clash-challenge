require 'rails_helper'

RSpec.describe Hero, type: :model do
  it "creates hero with correct default attributes" do
    my_hero = build(:hero)

    expect(my_hero.name).to eq("Crazy Dave")
    expect(my_hero.health).to eq(18573)
    expect(my_hero.attack).to eq(4106)
    expect(my_hero.speed).to eq(5)
    expect(my_hero.dodge_rate).to eq(0)
    expect(my_hero.critical_rate).to eq(0)
  end
end
