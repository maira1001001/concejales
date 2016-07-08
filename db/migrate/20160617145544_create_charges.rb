class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.belongs_to  :district, index: true
      t.belongs_to  :political_party, index: true

      t.string      :start_date
      t.string      :end_date
      t.boolean     :in_function, default: true

      t.timestamps null: false
    end
  end
end
