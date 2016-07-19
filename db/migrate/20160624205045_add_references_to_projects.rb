class AddReferencesToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :participation, index: true, foreign_key: true
    add_reference :projects, :district, index: true, foreign_key: true
    add_reference :projects, :political_party, index: true, foreign_key: true
  end
end
