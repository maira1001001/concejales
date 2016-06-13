class CreateProjects < ActiveRecord::Migration

  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :category
      t.integer :project_type

      t.references :district, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
