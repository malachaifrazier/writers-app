class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string  :title
      t.string  :language
      t.text    :fabula
      t.text    :premise
      t.text    :setting
      t.integer :user_id

      t.timestamps
    end
  end
end
