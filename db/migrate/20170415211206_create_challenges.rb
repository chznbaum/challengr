class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :description
      t.text :rules
      t.text :main_image
      t.text :thumb_image
      t.text :official_link
      t.text :register_link

      t.timestamps
    end
  end
end
