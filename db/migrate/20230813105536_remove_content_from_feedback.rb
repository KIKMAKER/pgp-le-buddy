class RemoveContentFromFeedback < ActiveRecord::Migration[7.0]
  def change
    remove_column :feedbacks, :content
  end
end
