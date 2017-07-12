class Picture < ApplicationRecord
  # associations
  belongs_to :property
  
  # picture uploader
  mount_uploader :picture, PictureUploader
end
