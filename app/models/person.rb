class Person < ActiveRecord::Base
  has_one :user
  has_many :participations, autosave: true
  belongs_to :current_district, class_name: 'District', foreign_key: 'current_district_id'

  accepts_nested_attributes_for :participations

  validates :name, :last_name, :current_district_id, presence: true

  def current_participation
    participations.detect { |p| p.charge.in_function? } if participations.any?
  end

  def to_s
    "#{last_name}, #{name}"
  end

  def principal_data_completed?
    name.present? && last_name.present? && current_district.present?
  end

  def belongs_to_charge?
    participations.any?
  end

end
