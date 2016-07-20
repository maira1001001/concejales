class AddReferencesToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :collaborator, index: true
    add_foreign_key :users, :participations, column: :collaborator_id

    add_reference :users, :district, index: true
    add_reference :users, :political_party, index: true
  end
end
