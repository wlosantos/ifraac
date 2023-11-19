class Message < ApplicationRecord
  belongs_to :moderator, class_name: 'User', optional: true
  belongs_to :response, class_name: 'Message', optional: true
  belongs_to :talk_channel
  belongs_to :talk, polymorphic: true

  enum moderation_status: { blank: 0, pending: 1, approved: 2, rejected: 3 }

  validates :content, presence: true, length: { maximum: 240 }
end
