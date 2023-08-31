class RemoveUserFromFeedback < ActiveRecord::Migration[7.0]
  def change
    remove_reference :feedbacks, :user, foreign_key: true, index: true
    add_reference :feedbacks, :profile, foreign_key: true
  end
end
