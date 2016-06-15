class Person < ActiveRecord::Base
  belongs_to :district
  has_one :user
  has_many :projects
end
