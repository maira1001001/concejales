class Person < ActiveRecord::Base
  has_one :user
  has_one :participation, autosave: true
  belongs_to :current_district, class_name: 'District', foreign_key: 'current_district_id'

  accepts_nested_attributes_for :participation

  validates :name, :last_name, presence: true
  validates_associated :current_district_id, :participation, presence: true, on: :update


  def to_s
    "#{last_name}, #{name}"
  end

  def current_term
    participation.current_term
  end

end
