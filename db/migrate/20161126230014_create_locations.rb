class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :nation
      t.string :state
      t.string :city
      t.text :description
      t.integer :position
      t.integer :project_id

      t.timestamps
    end
  end
end
