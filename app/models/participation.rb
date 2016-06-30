class Participation < ActiveRecord::Base
  belongs_to :person
  belongs_to :term

  enum roles: %i(councilor collaborator)
  enum status: %i(enable disable)

  scope :my_participation, lambda { |person| find_by(person: person) }

end
