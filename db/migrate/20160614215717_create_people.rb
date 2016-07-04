class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :last_name

      t.belongs_to :current_district, index: true

      t.timestamps null: false
    end
    add_foreign_key :people, :districts, column: :current_district_id
  end
end
