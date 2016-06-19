class Team < ActiveRecord::Base
  has_many :projects
  has_many :collaborators
  has_one  :councilor
end
