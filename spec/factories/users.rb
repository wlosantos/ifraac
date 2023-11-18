FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { "#{name.split.join('_')}@#{Faker::Internet.domain_name}" }
    password { '123456' }
    password_confirmation { password }
    fractal_id { rand(1000..9_999) }
    photo_url { Faker::Avatar.image }
    token_dg { Faker::Internet.uuid }
  end
end