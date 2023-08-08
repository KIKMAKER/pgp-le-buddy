class ProfileLanguage < ApplicationRecord
  belongs_to :profile
  belongs_to :language
end
