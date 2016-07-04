class Term < ActiveRecord::Base
  has_one :councilor, -> { councilor }, class_name: 'Participation', foreign_key: 'term_id'
  has_many   :collaborators, -> { collaborator }, class_name: 'Participation', foreign_key: 'term_id'
  belongs_to :section
  belongs_to :district
  belongs_to :political_party
  has_many   :projects

  scope :my_term, lambda { |councilor| find_by(councilor: councilor) }
end
