class Post < ApplicationRecord
  
  validates :title, presence: true
  validates :content, presence: true
  
  has_many :likes, dependent: :destroy
  
  mount_uploaders :images, ImageUploader
  
  
end
