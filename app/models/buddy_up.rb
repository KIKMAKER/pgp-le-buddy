class BuddyUp < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  validates :name, :description, :challenge, :user, presence: true
  enum :status, [:active, :archived, :complete]
end
