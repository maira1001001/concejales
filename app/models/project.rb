class Project < ActiveRecord::Base

  belongs_to :district
  belongs_to :political_party
  belongs_to :participation
  has_many   :project_files

  enum project_type: { ordinance: 0, decree: 1, resolution: 2, communication: 3, document: 4 }
  enum category: { salud: 0, educacion: 1, desarrollo_social: 2 }

  validates :title, :description, :category, :project_type, presence: true
#  validates_associated :project_files
  accepts_nested_attributes_for :project_files, allow_destroy: true

  def to_s
    title
  end

end

