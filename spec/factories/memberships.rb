FactoryBot.define do
  factory :membership do
    association :list
    association :member
  end
end
