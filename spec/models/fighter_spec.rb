require 'rails_helper'

RSpec.describe Fighter, type: :model do
  let(:hero) { create(:hero) }
  let(:fighter) { Fighter.create(hero: hero) }

  it "stores the hero attributes correctly" do
    expect(fighter.hero_attributes).to eq(hero.to_hash)
  end

  it "delegates the hero attributes to the hero" do
    expect(fighter.name).to eq("Crazy Dave")
    expect(fighter.health).to eq(18573)
    expect(fighter.attack).to eq(4106)
    expect(fighter.speed).to eq(5)
    expect(fighter.dodge_rate).to eq(0)
    expect(fighter.critical_rate).to eq(0)
    expect(fighter.power).to eq(18573 + 4106)
    expect(fighter.rank).to eq(5)
  end

  it "has a win and a loss" do
    expect(fighter.respond_to? :win).to be(true)
    expect(fighter.respond_to? :loss).to be(true)
  end
end
