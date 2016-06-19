class CreateTeam < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :active
    end
  end
end
