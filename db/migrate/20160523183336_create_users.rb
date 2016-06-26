class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :roles
      t.integer :state, default: 0
      t.boolean :force_password_change, default: true

      t.timestamps null: false
    end
  end
end
