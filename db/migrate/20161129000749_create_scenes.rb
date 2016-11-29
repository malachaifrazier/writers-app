class CreateScenes < ActiveRecord::Migration[5.0]
  def change
    create_table :scenes do |t|
      t.string :title
      t.integer :position
      t.text :description
      t.integer :chapter_id

      t.timestamps
    end
  end
end
