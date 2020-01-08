class Dish < ActiveRecord::Base
    belongs_to :restaurant, optional: false
    has_many :dish_tags
    has_many :tags, through: :dish_tags
    validates :name, presence: true

    def self.names
        #all the names of the dishes
    end

    def self.max_tags
        #single dish with the most tags
    end

    def self.untagged
        #dishes with no tags
    end

    def self.average_tag_count 
        #average tag count for dishes
    end

    def tag_count
        #number of tags for a dish
    end

    def tag_names
        #names of the tags on a dish
    end

    def most_popular_tag
        #most widely used tag for a dish
    end
end