class PostingPage < ApplicationRecord
  validates :content, presence: true
  mount_uploader :image, ImageUploader
end
