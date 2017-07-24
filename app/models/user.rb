class User < ApplicationRecord
  acts_as_token_authenticatable

  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true
  has_many :hosts, dependent: :destroy
  has_many :notifications, dependent: :destroy
end
