class Project < ActiveRecord::Base

  has_many :project_files, dependent: :destroy

  validates :title, :description, :district, :dosier, presence: true

  validates_associated :project_files #, if: :created?

  accepts_nested_attributes_for :project_files, allow_destroy: true

end
