class Participation < ActiveRecord::Base
  belongs_to :person
  has_many :terms, autosave: true
  has_one :collaborator, class_name: 'Participation', foreign_key: 'collaborator_id'

  accepts_nested_attributes_for :term

  validates_associated :term

  def current_term
  end

end
