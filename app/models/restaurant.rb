require 'pry'

class Restaurant < ActiveRecord::Base
    has_many :dishes
    validates :name, presence: true

    scope :with_long_names, -> { where('LENGTH(name) > ?', 12) }

    def self.mcdonalds
        self.find_by(name: 'McDonalds')
    end

    def self.tenth
        self.find(10)
    end

    def self.group_by_dish_count
        Restaurant.select('restaurants.*, COUNT(dishes.restaurant_id) AS dish_count').joins(:dishes).group("dishes.restaurant_id")

        # the above query returns an ActiveRecord_Relation object, which I can then call other ActiveRecord query methods on in my other methods in order to re-use this code and make it into a helper method

        # sql =   "SELECT restaurants.*, COUNT(dishes.restaurant_id)
        #         AS dish_count
        #         FROM restaurants
        #         INNER JOIN dishes
        #         ON restaurants.id = dishes.restaurant_id
        #         GROUP BY dishes.restaurant_id"
    end

    def self.max_dishes
        # find the restaurant with the most dishes

        self.group_by_dish_count.order("dish_count desc").limit(1)
    end

    def self.focused
        # find all the restaurants with fewer than 5 dishes

        self.group_by_dish_count.having("dish_count < ?", 5)
    end

    def self.large_menu
        # find all the restaurants with more than 20 dishes

        self.group_by_dish_count.having("dish_count > ?", 20)
    end

    def self.vegetarian
        # find all restaurants where all of the dishes are tagged vegetarian

        # this method requires information from all 4 tables - may need to write some helper methods!!!
    end

    def self.name_like(name)
        # find all restaurants where the name is like the name passed in
    end

    def self.name_not_like(name)
        # find all restaurants where the name is not like the name passed in
    end
end
