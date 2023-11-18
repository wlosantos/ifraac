# frozen_string_literal: true

class User < ActiveRecord::Base
  belongs_to :unit, foreign_key: :unit_dg, primary_key: :unit_dg

  validates :name, :unit_dg, :fractal_id, :token_dg, presence: true
  validates :email, :fractal_id, :token_dg, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
