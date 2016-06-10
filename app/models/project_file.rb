class ProjectFile < ActiveRecord::Base


  validates :attachment, :name, :version, presence: true
  validates :name, uniqueness: true

  delegate :path, to: :attachment
  
  belongs_to :project, autosave: true

  mount_uploader :attachment,  AttachmentUploader, allow_destroy: true

end
