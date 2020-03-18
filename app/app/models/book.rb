class Book < ApplicationRecord
  validates :image, :presence => true, :uniqueness => true
  validates :name, :presence => true, :uniqueness => true
  has_and_belongs_to_many :subjects
  belongs_to :author
end
