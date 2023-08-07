class BuddyUp < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  validates :name, :description, :challenge, :user, presence: true
  enum :status, { active: 0, archived: 1, complete: 2 }, default: :active
end
