class CreateProjectFiles < ActiveRecord::Migration
  def self.up
    create_table :project_files do |t|
      t.string :version
      t.string :attachment
      t.string :name

      t.references :project, foreign_key: true, null: false

      t.timestamps null: false
    end

  end

  def self.down
    drop_table :project_files
  end
end
