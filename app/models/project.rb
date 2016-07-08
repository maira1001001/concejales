class Project < ActiveRecord::Base

  enum project_type: { ordinance: 0, decree: 1, resolution:2, communication:3, document: 4 }
  enum category: { salud: 0, educacion: 1 } #definir bien las categorias :D

  belongs_to :charge
  has_many :project_files

  validates :title, :description, :category, presence: true
  validates_associated :project_files

  accepts_nested_attributes_for :project_files, allow_destroy: true

  scope :my_projects, lambda { |person| where(charge: charge).join(:participation).where(person: person )  }

  def to_s
    title
  end

end

