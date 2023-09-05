class Favourite < ApplicationRecord
  belongs_to :profile
  belongs_to :buddy_up
end
