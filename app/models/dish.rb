class Dish < ActiveRecord::Base
    belongs_to :restaurant, optional: false
    has_many :dish_tags
    has_many :tags, through: :dish_tags
    validates :name, presence: true
end