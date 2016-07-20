class Participation < ActiveRecord::Base
  belongs_to :councilor, -> { councilor }, class_name: 'User', foreign_key: 'councilor_id'
  belongs_to :district
  belongs_to :political_party
  has_many   :projects, dependent: :destroy, autosave: true
  has_many   :collaborators, -> { collaborator }, class_name: 'User', foreign_key: 'collaborator_id'

  validates :start_date, :in_function, :district_id, :political_party_id, presence: true
  validates_with RangeDateValidator

  accepts_nested_attributes_for :councilor
#  validates_associated :councilor
end
