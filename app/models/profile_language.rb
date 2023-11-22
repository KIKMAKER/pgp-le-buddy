class ProfileLanguage < ApplicationRecord
  belongs_to :profile
  belongs_to :language
  validates :profile, uniqueness: { scope: :language,
    message: "duplicate" }
end
