class ProjectFile < ActiveRecord::Base
  belongs_to :project, autosave: true

  mount_uploader :attachment,  AttachmentUploader, allow_destroy: true

  validates :name, :attachment, presence: true

  delegate :path, to: :attachment

end
