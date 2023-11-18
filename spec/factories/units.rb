FactoryBot.define do
  factory :unit do
    name { Faker::Educator.secondary_school }
    unit_dg { rand(1...9_999) }
    status { :active }
  end
end
