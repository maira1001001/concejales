class CreateProjects < ActiveRecord::Migration

  def change
    create_table :projects do |t|
      t.string  :title,         null: false
      t.text    :description
      t.integer :category,      null: false
      t.integer :project_type,  null: false
      t.string  :dossier
      t.string  :dossier_url
      t.boolean :is_visible,  default: true

      t.timestamps null: false
    end

  end
end
