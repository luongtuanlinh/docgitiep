class Recipe < ApplicationRecord
    scope :premium, -> { where(is_premium: true) }
    scope :common, -> { where(is_premium: false) }

    belongs_to :category
    has_many :ingredients, dependent: :destroy

    has_many :comments, dependent: :destroy
    has_many :bookmarks, dependent: :destroy

    paginates_per 6
end
