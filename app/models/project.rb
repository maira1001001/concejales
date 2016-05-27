class Project < ActiveRecord::Base
  validates :title, :description, :district, :dosier, presence: true
  mount_uploader :file, AttachmentUploader
end
