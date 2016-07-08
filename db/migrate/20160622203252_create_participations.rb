class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.integer :role
      t.integer :status, default: 0
      t.belongs_to :person, index: true
      t.belongs_to :charges,   index: true
    end
  end
end
