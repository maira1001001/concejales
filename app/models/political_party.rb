class PoliticalParty < ActiveRecord::Base
  validates :name, presence: true
  has_many :participations
end
