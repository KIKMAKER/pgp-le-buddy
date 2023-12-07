class BuddyUp < ApplicationRecord
  belongs_to :profile
  belongs_to :challenge
  has_many :requests, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_one :user, through: :profile

  validates :name, :description, :profile, presence: true
  enum :status, { active: 0, archived: 1, complete: 2 }, default: :active

  # Set up pg_search
  include PgSearch::Model
  pg_search_scope :search,
    against: [ :name, :description, :availability, :status ],
    associated_against: {
      requests: [ :status, :message ],
      feedbacks: [ :message, :work_again ]
    },
    using: { tsearch: { prefix: true } }

  def self.active_list(profile)
    buddy_ups = BuddyUp.where(profile: , status: :active)
    buddy_ups.count > 0 ? buddy_ups : nil
  end

  def self.complete_list(profile)
    buddy_ups = BuddyUp.where(profile: , status: :complete)
    buddy_ups.count > 0 ? buddy_ups : nil
  end

  def self.archive_list(profile)
    buddy_ups = BuddyUp.where(profile: , status: :archived)
    buddy_ups.count > 0 ? buddy_ups : nil
  end

  def self.progress(profile)
    completed = BuddyUp.where(profile: , status: :complete).count
    total = BuddyUp.where(profile:).count.to_f
    (completed / total) * 100
  end

  def self.active_complete_total(profile)
    all = BuddyUp.where(profile:)
    archived = BuddyUp.where(profile: , status: :archived)
    all.count - archived.count
  end

  def self.all_count(profile)
    BuddyUp.where(profile:).count
  end

  def self.abandonment(profile)
    all = BuddyUp.where(profile:).count
    archived = BuddyUp.where(profile:).where(status: :archived).count.to_f
    (archived / all) * 100
  end

  def change_status(change)
    case change
    when "make_active"
      self.active!
    when "make_archived"
      self.archived!
    when "make_complete"
      self.complete!
    end
  end
end
