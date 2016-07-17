class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :name, null: false
      t.string :website

      t.timestamps null: false
    end
  end
end
