class Challenge < ApplicationRecord
  validates :module, :skill, :name, presence: true
end
