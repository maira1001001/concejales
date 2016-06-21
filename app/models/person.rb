class Person < ActiveRecord::Base
  has_one :user

  attr_accessor :district

  before_create :add_district_to_collection if @district.present?

  def add_district_to_collection
    districts << district
  end

end
