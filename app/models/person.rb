class Person < ActiveRecord::Base
  has_one :user
  has_one :participation, autosave: true
  belongs_to :current_district, class_name: 'District', foreign_key: 'current_district_id'

  def to_s
    "#{last_name}, #{name}"
  end

end
