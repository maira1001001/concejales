class AddCreatedByToProject < ActiveRecord::Migration
  def change
    add_reference :projects, :created_by, references: :person, index: true
  end
end
