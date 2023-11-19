FactoryBot.define do
  factory :message do
    moderator { nil }
    content { Faker::Lorem.paragraph_by_chars(number: 240, supplemental: false) }
    moderation_status { :blank }
    moderated_at { nil }
    refused_at { nil }
    response { nil }
    talk_type { 'UserTalk' }
    talk_id { create(:user_talk) }
  end
end
