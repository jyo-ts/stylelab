class Post < ApplicationRecord
  
  validates :title, presence: true
  validates :content, presence: true
  
  has_many :likes, dependent: :destroy
  
  belongs_to :user
  
  mount_uploaders :images, ImageUploader
  
  
end
