class Participation < ActiveRecord::Base
  belongs_to :person
  belongs_to :term, autosave: true
  has_one :collaborator, class: 'Participation', foreign_key: 'collaborator_id'
end
