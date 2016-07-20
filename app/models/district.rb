class District < ActiveRecord::Base
  validates :name, presence: true
  has_many :district
end
