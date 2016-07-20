class PoliticalParty < ActiveRecord::Base
  validates :name, presence: true
  has_many :participations

  def to_s
    name
  end
end
