class CreateChapters < ActiveRecord::Migration[5.0]
  def change
    create_table :chapters do |t|
      t.string :title
      t.integer :position
      t.text :reason
      t.text :note
      t.integer :project_id

      t.timestamps
    end
  end
end
