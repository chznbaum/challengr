class CreatePrompts < ActiveRecord::Migration[5.0]
  def change
    create_table :prompts do |t|
      t.string :title
      t.text :description
      t.text :prompt_image

      t.timestamps
    end
  end
end
