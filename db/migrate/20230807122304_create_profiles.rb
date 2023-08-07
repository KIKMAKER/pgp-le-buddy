class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.text :bio
      t.integer :batch
      t.boolean :show_email

      t.timestamps
    end
  end
end
