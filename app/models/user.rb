# frozen_string_literal: true

class User < ActiveRecord::Base
  belongs_to :unit, foreign_key: :unit_dg, primary_key: :unit_dg
  has_many :talk_channels, inverse_of: :created_by, foreign_key: :created_by_id

  validates :name, :unit_dg, :fractal_id, :token_dg, presence: true
  validates :email, :fractal_id, :token_dg, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
