class TalkChannel < ApplicationRecord
  belongs_to :created_by, class_name: 'User', foreign_key: :created_by_id
  belongs_to :unit, foreign_key: :unit_dg, primary_key: :unit_dg

  enum kinds: { privates: 0, groups: 1, helpdesk: 2 }

  validates :name, presence: true, length: { maximum: 30 }
  validates :closed_at, presence: true
  validates :moderated, presence: true
  validates :closed, inclusion: { in: [true, false] }
end
