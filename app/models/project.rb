class Project < ActiveRecord::Base

  attr_accessor :input_tags

  enum project_type: { ordinance: 0, decree: 1, resolution:2, comunication:3, document: 4 }

  enum category: { salud: 0, educacion: 1 } #definir bien las categorias :D

  has_and_belongs_to_many :tags
  has_many :project_files, dependent: :destroy
  belongs_to :district

  validates :title, :description, :district, :category, presence: true

  validates_associated :project_files

  accepts_nested_attributes_for :project_files, allow_destroy: true

end

