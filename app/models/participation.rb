class Participation < ActiveRecord::Base
  belongs_to :person
  belongs_to :term

  enum role: %i(councilor collaborator)
  enum status: %i(enable disable)

  validates :role, presence: true

#  scope :my_participation, lambda { |person| find_by(person: person) }

end
