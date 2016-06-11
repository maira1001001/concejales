class CreateProjects < ActiveRecord::Migration

  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :dossier
      t.integer :category

      t.references :district, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
