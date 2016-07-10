class PoliticalParty < ActiveRecord::Base
  has_many :charges

  def to_s
    name
  end
end
