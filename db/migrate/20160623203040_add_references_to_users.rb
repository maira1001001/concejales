class AddReferencesToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :collaborator, index: true
    add_foreign_key :users, :participations, column: :collaborator_id
  end
end
