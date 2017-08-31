require 'rails_helper'

RSpec.describe Weapon, type: :model do
  it "has fighters" do
    weapon = create(:weapon)

    expect(weapon.respond_to? :fighters).to be(true)
  end

  it "has mean damage" do
    weapon = create(:weapon)

    expect(weapon.mean_damage).to eq(5)
  end

  it "can't have negative damage" do
    expect{ Weapon.create! name: "wrong", min_damage: -10, max_damage: 1 }
      .to raise_error(ActiveRecord::RecordInvalid)
    expect{ Weapon.create! name: "wrong", min_damage: 0, max_damage: -1 }
      .to raise_error(ActiveRecord::RecordInvalid)
  end

  it "can't have max damage inferior to min damage" do
    expect{ Weapon.create! name: "wrong", min_damage: 10, max_damage: 1 }
      .to raise_error(ActiveRecord::RecordInvalid)
  end

end
