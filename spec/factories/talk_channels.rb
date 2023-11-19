FactoryBot.define do
  factory :talk_channel do
    created_by
    unit
    name { [Faker::Educator.university, Faker::Educator.secondary_school, Faker::Educator.campus].sample }
    kinds { %i[groups].sample }
    is_blocked { false }
    read_only { false }
    moderated { false }
    closed { false }
    closed_at { nil }

    trait :help_desk do
      kinds { :help_desk }
    end

    trait :privates do
      name { '' }
      kinds { :privates }
    end

    trait :closed do
      closed { true }
      closed_at { Time.zone.now }
    end
  end
end
