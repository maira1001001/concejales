class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.integer :role
      t.integer :status
      t.belongs_to :person, index: true
      t.belongs_to :term,   index: true
    end
  end
end
