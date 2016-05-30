class CreateProjectFiles < ActiveRecord::Migration
  def self.up
    create_table :project_files do |t|
      t.string :version
      t.string :name
      t.string :attachment

      t.references :project, index: true

      t.timestamps null: false
    end

    add_foreign_key :project_files, :projects
  end

  def self.down
    drop_table :project_files
  end

end
