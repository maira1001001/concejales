class CreateAdherences < ActiveRecord::Migration
  def change
    create_table :adherences, id: false do |t|
      t.belongs_to :user,     index: true
      t.belongs_to :project,  index: true
    end
  end
end
