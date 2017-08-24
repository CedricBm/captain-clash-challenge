FactoryGirl.define do
  factory :fight_event do
    association :fight, factory: :fight
  end
end
