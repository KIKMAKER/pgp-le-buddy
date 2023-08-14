class Request < ApplicationRecord
  belongs_to :buddy_up
  belongs_to :user

  validates :status, presence: true
  enum :status, { requested: 0, approved: 1, denied: 2 }, default: :requested
end
