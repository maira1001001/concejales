class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.belongs_to  :councilor,   index: true
      t.belongs_to  :district, index: true
      t.belongs_to  :political_party

      t.string      :start_date
      t.string      :end_date

      t.timestamps null: false
    end
    add_foreign_key :terms, :people, column: :councilor_id
  end
end
