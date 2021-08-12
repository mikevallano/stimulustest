FactoryBot.define do
  factory :list do
    name { 'Action' }
    description { 'actiony' }
    association :owner
  end
end
