class Request < ApplicationRecord
  belongs_to :buddy_up
  belongs_to :profile
  has_one :user, through: :profile

  validates :status, :profile, presence: true
  enum :status, { requested: 0, approved: 1, denied: 2 }, default: :requested

  def self.requested(profile)
    requests = Request.where(profile:)
    requests.count > 0 ? requests : nil
  end

  def self.success_rate(profile)
    requests = Request.where(profile:).count
    success = Request.where(profile: , status: :approved).count.to_f
    (success / requests) * 100
  end
end
