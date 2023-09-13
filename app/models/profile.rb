class Profile < ApplicationRecord
  belongs_to :user
  has_many :profile_languages, dependent: :destroy
  has_many :languages, through: :profile_languages
  has_many :feedbacks
  has_many :buddy_ups
  has_many :requests, dependent: :destroy
  has_many :favourites, dependent: :destroy

  # Find all the BuddyUps that were favourited by this profile
  def fav_buddy_ups
    bu_array = []
    self.favourites.each do |favourite|
      bu_array << favourite.buddy_up
    end
    return bu_array
  end
end
