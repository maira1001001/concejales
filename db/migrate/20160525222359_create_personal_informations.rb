class CreatePersonalInformations < ActiveRecord::Migration
  def change
    create_table :personal_informations do |t|

      t.timestamps null: false
    end
  end
end
