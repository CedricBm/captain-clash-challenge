FactoryGirl.define do
  factory :fight do
    association :winner, factory: :hero, name: "Winner"
    association :loser, factory: :hero, name: "Loser"
  end
end
