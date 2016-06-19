class AddTeamToCollaborators < ActiveRecord::Migration
  def change
    add_reference :collaborators, :team, index: true, foreign_key: true
  end
end
