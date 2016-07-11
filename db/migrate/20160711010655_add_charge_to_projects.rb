class AddChargeToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :charge, index: true, foreign_key: true
  end
end
