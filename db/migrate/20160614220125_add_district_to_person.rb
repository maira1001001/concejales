class AddDistrictToPerson < ActiveRecord::Migration
  def change
    add_reference :projects, :district, index: true, foreign_key: true
  end
end
