class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.string :module
      t.string :skill
      t.string :name
      t.string :url_fragment

      t.timestamps
    end
  end
end
