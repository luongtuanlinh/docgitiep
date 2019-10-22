class Recipe < ApplicationRecord
    belongs_to :category
    has_many :ingredients
    
    paginates_per 4
end
