class AddTeamToCouncilors < ActiveRecord::Migration
  def change
    add_reference :councilors, :team, index: true, foreign_key: true
  end
end
