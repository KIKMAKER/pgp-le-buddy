class CreateBuddyUps < ActiveRecord::Migration[7.0]
  def change
    create_table :buddy_ups do |t|
      t.string :name
      t.text :description
      t.boolean :auto_match
      t.integer :status
      t.text :availability
      t.integer :favourites
      t.references :user, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
