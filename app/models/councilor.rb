class Councilor < Person
  has_many :district,         through: :terms
  has_many :political_party,  through: :terms
  belongs_to :team

  def to_s
    "#{last_name}, #{name}"
  end

  #Return last district where actually belongs
  def district
    district.first unless district.blank?
  end

end
