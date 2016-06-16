class CreateCouncilors < ActiveRecord::Migration
  def change
    create_table :councilors do |t|
      t.string :personal_website
    end
  end
end
