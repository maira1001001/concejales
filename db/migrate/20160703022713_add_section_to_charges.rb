class AddSectionToCharges < ActiveRecord::Migration
  def change
    add_reference :charges, :section, index: true, foreign_key: true
  end
end
