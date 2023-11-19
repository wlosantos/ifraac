class UserTalk < ApplicationRecord
  belongs_to :participant, class_name: 'User', foreign_key: :participant_id
  belongs_to :conversation, polymorphic: true

  enum status: { active: 0, blocked: 1 }
end
