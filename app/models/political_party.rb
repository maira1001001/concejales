class PoliticalParty < ActiveRecord::Base
  has_many :terms
end
