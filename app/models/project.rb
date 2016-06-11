class Project < ActiveRecord::Base

  has_many :project_files, dependent: :destroy

  belongs_to :district

  validates :title, :description, :district, :dossier, :category, presence: true

  validates_associated :project_files

  accepts_nested_attributes_for :project_files, allow_destroy: true

end

