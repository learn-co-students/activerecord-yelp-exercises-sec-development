require 'pry'

class Tag < ActiveRecord::Base
    has_many :dish_tags
    has_many :dishes, through: :dish_tags
    has_many :restaurants, through: :dishes
    validates :name, presence: true
    validate :name_length
    validate :name_num_of_words

    def name_length
        if self.name && self.name.length < 3
            errors.add(:name, "Must be at least 3 characters long")
        end
    end

    def name_num_of_words
        name = "Italian cuisine"
        name2 = "pastry"
        num_of_words = nil

        if self.name
            num_of_words = self.name.split(' ')
        end

        if self.name && num_of_words.length > 2
            errors.add(:name, "Name cannot be more than two words")
        end
    end

    def self.group_by_dish_count
        self.left_outer_joins(:dish_tags).select("tags.*, COUNT(dish_tags.tag_id) AS dish_count").group("dish_tags.tag_id")
    end

    def self.most_common
        #tag with the most associated dishes

        self.group_by_dish_count.order("dish_count DESC")[0]
    end

    def self.least_common
        #tag with the fewest associated dishes

        self.group_by_dish_count.order("dish_count ASC").having("dish_count > ?", 0)[0]
    end

    def self.unused
        #all tags that haven't been used

        self.group_by_dish_count.having("dish_count = ?", 0)
    end

    def self.uncommon
        #all tags that have been used fewer than 5 times

        self.group_by_dish_count.having("dish_count < ?", 5)
    end

    def self.popular
        #top 5 tags by use

        self.group_by_dish_count.order("dish_count DESC").limit(5)
    end

    def distinct_restaurants
        self.restaurants.distinct
    end

    def top_restaurant
        #restaurant that uses this tag the most

        self.class.select("restaurants.*, COUNT(dish_tags.tag_id) AS tag_count").joins(:dish_tags).joins(:dishes).joins(:restaurants).where("dish_tags.tag_id = ?", self.id).group("restaurants.id").order("tag_count DESC")[0]
    end

    def dish_count
        #how many dishes use this tag

        self.dishes.count
    end
end
