class Profile < ApplicationRecord
  belongs_to :user
  has_many :profile_languages
  has_many :languages, through: :profile_languages
  validates :batch, presence: true
end
