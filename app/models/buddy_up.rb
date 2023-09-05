class BuddyUp < ApplicationRecord
  belongs_to :profile
  belongs_to :challenge
  has_many :requests, dependent: :destroy
  has_many :feedbacks
  has_one :user, through: :profile
  has_many :favourites, dependent: :destroy

  validates :name, :description, :challenge, :profile, presence: true
  enum :status, { active: 0, archived: 1, complete: 2 }, default: :active
end
