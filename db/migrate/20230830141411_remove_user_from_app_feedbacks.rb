class RemoveUserFromAppFeedbacks < ActiveRecord::Migration[7.0]
  def change
    remove_reference :app_feedbacks, :user, foreign_key: true, index: true
    add_reference :app_feedbacks, :profile, foreign_key: true
  end
end
