class Project < ActiveRecord::Base

  belongs_to :district
  belongs_to :political_party
  belongs_to :participation, autosave: true
  has_many   :project_files

  before_save :update_attributes

  enum project_type: { ordinance: 0, decree: 1, resolution: 2, communication: 3, document: 4 }
  enum category: { salud: 0, educacion: 1, desarrollo_social: 2 }

  validates :title, :description, :category, :project_type, presence: true
#  validates_associated :project_files
  accepts_nested_attributes_for :project_files, allow_destroy: true

  def to_s
    title
  end

  def update_attributes
    district = participation.district
    political_party = participation.political_party
  end

  def not_visible
    update_attribute(:is_visible, false)
  end

  def visible
    update_attribute(:is_visible, true)
  end

end

