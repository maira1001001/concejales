class AddCouncilorToCharges < ActiveRecord::Migration
  def change
    add_reference :charges, :councilor, index: true
    add_foreign_key :charges, :participations, column: :councilor_id
  end
end
