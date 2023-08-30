class Request < ApplicationRecord
  belongs_to :buddy_up
  belongs_to :profile
  has_one :user, through: :profile

  validates :status, :profile, presence: true
  enum :status, { requested: 0, approved: 1, denied: 2 }, default: :requested
end
