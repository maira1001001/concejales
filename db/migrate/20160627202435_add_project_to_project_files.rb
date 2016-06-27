class AddProjectToProjectFiles < ActiveRecord::Migration
  def change
    add_reference :project_files, :project, index: true, foreign_key: true
  end
end
