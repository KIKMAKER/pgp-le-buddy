class Feedback < ApplicationRecord
  belongs_to :buddy_up
  belongs_to :user

  validates :work_again, presence: true
end
