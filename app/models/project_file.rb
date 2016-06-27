class ProjectFile < ActiveRecord::Base
  belongs_to :project, autosave: true

  validates :attachment, :name, presence: true

  validates :name, uniqueness: true

  delegate :path, to: :attachment

  mount_uploader :attachment,  AttachmentUploader, allow_destroy: true

end
