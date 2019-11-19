class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :replies
  has_many :bookmarks, dependent: :destroy
  has_many :ratings, dependent: :destroy

  has_many :premium_purchases

  def is_premium?
    premium_purchases.active.exists?
  end
end
