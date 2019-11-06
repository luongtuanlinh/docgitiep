class Recipe < ApplicationRecord
    belongs_to :category
    has_many :ingredients
    has_many :comments
    
    paginates_per 6
end
