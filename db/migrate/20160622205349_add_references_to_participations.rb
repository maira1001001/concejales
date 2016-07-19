class AddReferencesToParticipations < ActiveRecord::Migration
  def change
    add_reference :participations, :councilor, index: true
    add_foreign_key :participations, :users, column: :councilor_id

    add_reference :participations, :district, index: true, foreign_key: true

    add_reference :participations, :political_party, index: true, foreign_key: true
  end
end
