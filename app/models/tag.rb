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

    def nearest_restaurant(customer)
        # nearest restaurant to the customer with that tag - this method would have to take in a customer has an argument, in order to compare locations
        restaurants_with_tag = 
            Restaurant.select do |rest|
                rest.tag_names.include?(self.name)
            end

        restaurants_with_tag.sort{ |a, b| a.distance_from_customer(customer) - b.distance_from_customer(customer) }.first
    end

    def top_rated
        # top 3 rated restaurants with dishes that have this tag

        Restaurant.ordered_by_average_rating.select("restaurants.*").joins("INNER JOIN dishes ON restaurants.id = dishes.restaurant_id").joins("INNER JOIN dish_tags ON dishes.id = dish_tags.dish_id").joins("INNER JOIN tags ON dish_tags.tag_id = tags.id").where("tags.id = ?", self.id).limit(3)
    end
end
