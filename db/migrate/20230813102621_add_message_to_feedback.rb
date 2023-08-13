class AddMessageToFeedback < ActiveRecord::Migration[7.0]
  def change
    add_column :feedbacks, :message, :text
  end
end
