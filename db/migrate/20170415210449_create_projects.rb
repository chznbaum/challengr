class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.text :main_image
      t.text :thumb_image
      t.text :source_link
      t.text :view_link

      t.timestamps
    end
  end
end
