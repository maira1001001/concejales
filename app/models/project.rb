class Project < ActiveRecord::Base
  validates :title, :description, :district, :dosier, presence: true
  has_many :project_files, dependent: :destroy
  validates_associated :project_files

end

