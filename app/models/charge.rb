class Charge < ActiveRecord::Base
  has_one    :councilor, -> { councilor }, class_name: 'Participation', foreign_key: 'charge_id'
  has_many   :collaborators, -> { collaborator }, class_name: 'Participation', foreign_key: 'charge_id'
  belongs_to :section
  belongs_to :district
  belongs_to :political_party
  has_many   :projects

  validates :district_id, :political_party_id, :start_date, presence: true
  validates_with RangeDateValidator


end
