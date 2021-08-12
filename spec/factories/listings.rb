FactoryBot.define do
  factory :listing do
    association :movie
    association :list
  end
end
