class Participation < ActiveRecord::Base
  belongs_to :person
  belongs_to :term

  enum roles: %i(councilor collaborator)

end
