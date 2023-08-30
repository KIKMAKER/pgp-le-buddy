class RemoveUserFromRequests < ActiveRecord::Migration[7.0]
  def change
    remove_reference :requests, :user, foreign_key: true, index: true
    add_reference :requests, :profile, foreign_key: true
  end
end
