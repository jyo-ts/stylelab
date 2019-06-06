class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :likes, dependent: :destroy
  # has_many :friends, dependent: :destroy
  has_many :posts, dependent: :destroy
  
  has_attached_file :image, styles: { medium: "300x300>", thumb: "50x50>" }
  
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  
  
  
  # has_many :active_friends, foreign_key: :follower_id, class_name: "Friend", dependent: :destroy
  # has_many :followers, through: :active_friends, source: :follower
  # has_many :passive_friends, foreign_key: :followed_id, class_name: "Friend", dependent: :destroy
  # has_many :followeds, through: :passive_friends, source: :followed
  
  

  
  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end
  
  mount_uploader :photo, ImageUploader
  
end
