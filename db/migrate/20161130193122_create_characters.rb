class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :main_character
      t.integer :position
      t.integer :project_id

      t.timestamps
    end
  end
end
