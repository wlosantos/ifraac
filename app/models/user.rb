# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models

  belongs_to :unit, foreign_key: :unit_dg, primary_key: :unit_dg
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :validatable
  include DeviseTokenAuth::Concerns::User

  validates :name, :unit_dg, presence: true
  validates :token_dg, uniqueness: true
end
