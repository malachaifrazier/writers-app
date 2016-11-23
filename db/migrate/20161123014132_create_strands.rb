class CreateStrands < ActiveRecord::Migration[5.0]
  def change
    create_table :strands do |t|
      t.string :name
      t.integer :position
      t.integer :project_id
      t.text :description

      t.timestamps
    end
  end
end
