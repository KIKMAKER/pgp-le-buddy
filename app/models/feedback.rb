class Feedback < ApplicationRecord
  belongs_to :buddy_up
  belongs_to :profile

  validates :work_again, presence: true
end
