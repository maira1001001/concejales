class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :role,     null: false
      t.integer :status,    default: 0
      t.string  :name
      t.string  :last_name
      t.string  :dni
      t.boolean :force_password_change, default: true

      t.timestamps null: false
    end
  end
end
