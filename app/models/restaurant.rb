require 'pry'

class Restaurant < ActiveRecord::Base
    has_many :dishes
    validates :name, presence: true

    scope :with_long_names, -> { where('LENGTH(name) > 12') }

    def self.mcdonalds
        self.find_by(name: 'McDonalds')
    end

    def self.tenth
        self.find(10)
    end

    def self.max_dishes
        #find the restaurant with the most dishes

        sql =   "SELECT restaurants.name, COUNT(dishes.restaurant_id)
                AS dish_count
                FROM restaurants
                INNER JOIN dishes
                ON restaurants.id = dishes.restaurant_id
                GROUP BY dishes.restaurant_id
                ORDER BY dish_count DESC
                LIMIT 1"

        records_array = ActiveRecord::Base.connection.execute(sql)
        return records_array[0]
    end

    def self.focused
        #find all the restaurants with fewer than 5 dishes
    end

    def self.large_menu
        #find all the restaurants with more than 20 dishes
    end

    def self.vegetarian
        #find all restaurants where all of the dishes are tagged vegetarian
    end

    def self.name_like(name)
        #find all restaurants where the name is like the name passed in
    end

    def self.name_not_like(name)
        #find all restaurants where the name is not like the name passed in
    end
end
