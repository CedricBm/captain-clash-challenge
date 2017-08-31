require 'rails_helper'

RSpec.describe Shield, type: :model do
  it "has fighters" do
    shield = create(:shield)

    expect(shield.respond_to? :fighters).to be(true)
  end

  it "can't have negative armor" do
    expect{ Shield.create! name: "wrong", armor: -10 }
      .to raise_error(ActiveRecord::RecordInvalid)
  end
end
