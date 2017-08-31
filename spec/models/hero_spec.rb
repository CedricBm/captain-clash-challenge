require 'rails_helper'

RSpec.describe Hero, type: :model do
  it "creates hero with correct default attributes" do
    my_hero = create(:hero)

    expect(my_hero.name).to eq("Crazy Dave")
    expect(my_hero.health).to eq(18573)
    expect(my_hero.attack).to eq(4106)
    expect(my_hero.speed).to eq(5)
    expect(my_hero.dodge_rate).to eq(0)
    expect(my_hero.critical_rate).to eq(0)
    expect(my_hero.power).to eq(18573 + 4106)
    expect(my_hero.rank).to eq(5)
  end

  it "creates hero with correct power and rank" do
    my_hero = create(:hero, health: 7000, attack: 1500, dodge_rate: 20, critical_rate: 70)

    expect(my_hero.power).to eq(10950)
    expect(my_hero.rank).to eq(5)
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
    expect{ create(:hero, dodge_rate: ENV['MAX_DODGE_RATE'].to_i + 1) }.to raise_error(ActiveRecord::RecordInvalid)
    expect{ create(:hero, critical_rate: -1) }.to raise_error(ActiveRecord::RecordInvalid)
    expect{ create(:hero, critical_rate: ENV['MAX_CRITICAL_RATE'].to_i + 1) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "has fighters, wins and losses" do
    my_hero = build(:hero)

    expect(my_hero.respond_to? :fighters).to be(true)
    expect(my_hero.respond_to? :wins).to be(true)
    expect(my_hero.respond_to? :losses).to be(true)
  end

end
