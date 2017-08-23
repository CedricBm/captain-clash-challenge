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

  it "cannot create hero with nil attributes" do
    expect{ create(:hero, name: nil) }.to raise_error(ActiveRecord::RecordInvalid)
    expect{ create(:hero, name: "") }.to raise_error(ActiveRecord::RecordInvalid)
    expect{ create(:hero, health: nil) }.to raise_error(ActiveRecord::RecordInvalid)
    expect{ create(:hero, attack: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "cannot create hero with incorrect attributes" do
    expect{ create(:hero, health: -1) }.to raise_error(ActiveRecord::RecordInvalid)
    expect{ create(:hero, attack: -1) }.to raise_error(ActiveRecord::RecordInvalid)
    expect{ create(:hero, speed: -1) }.to raise_error(ActiveRecord::RecordInvalid)
    expect{ create(:hero, dodge_rate: -1) }.to raise_error(ActiveRecord::RecordInvalid)
    expect{ create(:hero, dodge_rate: 101) }.to raise_error(ActiveRecord::RecordInvalid)
    expect{ create(:hero, critical_rate: -1) }.to raise_error(ActiveRecord::RecordInvalid)
    expect{ create(:hero, critical_rate: 101) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
