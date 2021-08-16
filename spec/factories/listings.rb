FactoryBot.define do
  factory :listing do
    association :movie
    association :list
    association :creator
  end
end
