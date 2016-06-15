class AddCouncilorToProject < ActiveRecord::Migration
  def change
    add_reference :projects, :councilor, references: :person, index: true
  end
end
