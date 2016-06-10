class ProjectFile < ActiveRecord::Base
  belongs_to :project

  mount_uploader :attachment, AttatchmentUploader, allow_destroy: true

  validates :attachment, :name, :version, presence: true
  validates :name, uniqueness: true

  delegate :path, to: :attachment
end
