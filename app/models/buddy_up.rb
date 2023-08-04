class BuddyUp < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  validates :name, :description, :auto_match, :challenge, :user, presence: true
  enum :status, [:active, :archived, :complete]
end
