class Book < ApplicationRecord
  validates :image, :presence => true, :uniqueness => true
  validates :name, :presence => true, length: {maximum: 250}, :uniqueness => true
  has_and_belongs_to_many :subjects
  belongs_to :author
  has_many :bookmarks, dependent: :destroy

end
