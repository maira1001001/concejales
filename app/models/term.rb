class Term < ActiveRecord::Base
  belongs_to :councilor,      class_name: 'Participation', foreign_key: 'councilor_id'
  has_many   :collaborators,  class_name: 'Participation', foreign_key: 'collaborator_id'
  belongs_to :district
  belongs_to :political_party
  has_many   :projects
end
