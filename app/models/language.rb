class Language < ApplicationRecord
  has_many :profile_languages
  has_many :profiles, through: :profile_languages
  validates :name, presence: true, uniqueness: true
end
