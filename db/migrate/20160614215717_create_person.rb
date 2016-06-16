class CreatePerson < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :last_name
      t.string :photo
      t.string :type

      t.timestamps null: false
    end
  end
end
