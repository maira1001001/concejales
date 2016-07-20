class District < ActiveRecord::Base
  validates :name, presence: true
  has_many :district

  def to_s
    name
  end
end
