class Participation < ActiveRecord::Base
  belongs_to :person
  belongs_to :charge

  enum role: %i(councilor collaborator)
  enum status: %i(enable disable)

  validates :role, presence: true

end
