class Councilor < Person
  has_many :district,         through: :terms
  has_many :political_party,  through: :terms
end
