class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.date      :start_date
      t.date      :end_date
      t.boolean   :in_function, default: true

      t.timestamps null: false
    end
  end
end
