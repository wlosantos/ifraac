FactoryBot.define do
  factory :user, aliases: %i[created_by participant] do
    unit
    name { Faker::Name.name }
    email { "#{name.split.join('_')}@#{Faker::Internet.domain_name}" }
    fractal_id { rand(1000..9_999) }
    photo_url { Faker::Avatar.image }
    token_dg { Faker::Internet.uuid }
  end
end
