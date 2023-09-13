class Profile < ApplicationRecord
  belongs_to :user
  has_many :profile_languages, dependent: :destroy
  has_many :languages, through: :profile_languages
  has_many :feedbacks
  has_many :buddy_ups
  has_many :requests, dependent: :destroy
end
