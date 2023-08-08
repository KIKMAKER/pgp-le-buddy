class CreateProfileLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_languages do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true

      t.timestamps
    end
  end
end
