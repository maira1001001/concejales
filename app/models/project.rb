class Project < ActiveRecord::Base

  enum project_type: { ordinance: 0, decree: 1, resolution:2, communication:3, document: 4 }
  enum category: { salud: 0, educacion: 1 } #definir bien las categorias :D

  belongs_to :councilor, class_name: 'Person', foreign_key: 'councilor_id'
  belongs_to :created_by, class_name: 'Person', foreign_key: 'created_by_id'
  has_many :project_files, dependent: :destroy

  validates :title, :description, :category, presence: true
  validates_associated :project_files

  accepts_nested_attributes_for :project_files, allow_destroy: true

  def to_s
    title
  end

end

