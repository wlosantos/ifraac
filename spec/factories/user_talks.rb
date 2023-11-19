FactoryBot.define do
  factory :user_talk do
    participant
    status { :active }
    conversation_type { 'TalkChannel' }
    conversation_id { create(:talk_channel).id }
  end
end
