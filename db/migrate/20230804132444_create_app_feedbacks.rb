class CreateAppFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :app_feedbacks do |t|
      t.string :title
      t.text :contents
      t.datetime :datetime
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
