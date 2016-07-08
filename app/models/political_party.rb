class PoliticalParty < ActiveRecord::Base
  has_many :charges
end
