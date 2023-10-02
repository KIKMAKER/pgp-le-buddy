class Challenge < ApplicationRecord
  validates :module, :skill, :name, presence: true
  has_many :buddy_ups

  # Set up pg_search
  include PgSearch::Model
  pg_search_scope :search,
    against: [ :module, :skill, :name ],
    using: { tsearch: { prefix: true } }
end
