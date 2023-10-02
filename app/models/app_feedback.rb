class AppFeedback < ApplicationRecord
  belongs_to :profile
  has_one :user, through: :profile

  # Set up pg_search
  include PgSearch::Model
  pg_search_scope :search,
    against: [ :title, :contents ],
    using: { tsearch: { prefix: true } }
end
