class RemoveUserFromBuddyUp < ActiveRecord::Migration[7.0]
  def change
    remove_reference :buddy_ups, :user, foreign_key: true, index: true
    add_reference :buddy_ups, :profile, foreign_key: true
  end
end
