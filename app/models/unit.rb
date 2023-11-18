class Unit < ApplicationRecord
  has_many :users, foreign_key: :unit_dg, primary_key: :unit_dg

  validates :name, :unit_dg, presence: true
  validates :name, uniqueness: true, length: { maximum: 30 }

  enum status: { active: 0, inactive: 1 }
end
