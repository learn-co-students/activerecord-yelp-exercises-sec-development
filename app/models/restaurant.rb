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

    # was attempting to create a helper method that I could re-use, but I can't use .order on the returned array (I would have to use sort_by which seems as though it would be very expensive and defeat the purpose of using SQL queries)

    # def self.order_by_dish_num
    #     sql =   "SELECT restaurants.*, COUNT(dishes.restaurant_id)
    #             AS dish_count
    #             FROM restaurants
    #             INNER JOIN dishes
    #             ON restaurants.id = dishes.restaurant_id
    #             GROUP BY dishes.restaurant_id"
        
    #     records_array = ActiveRecord::Base.connection.execute(sql)
    #     records_array
    # end

    def self.max_dishes
        # find the restaurant with the most dishes

        sql =   "SELECT restaurants.*, COUNT(dishes.restaurant_id)
                AS dish_count
                FROM restaurants
                INNER JOIN dishes
                ON restaurants.id = dishes.restaurant_id
                GROUP BY dishes.restaurant_id
                ORDER BY dish_count DESC
                LIMIT 1"

        records_array = ActiveRecord::Base.connection.execute(sql)
        records_array[0]
    end

    def self.focused
        # find all the restaurants with fewer than 5 dishes

        sql =   "SELECT restaurants.*, COUNT(dishes.restaurant_id)
                AS dish_count
                FROM restaurants
                INNER JOIN dishes
                ON restaurants.id = dishes.restaurant_id
                GROUP BY dishes.restaurant_id
                HAVING dish_count < 5"

        # this SQL query works, but when I try to pass in 5 as an argument (i.e. with a '?') nothing gets returned

        records_array = ActiveRecord::Base.connection.execute(sql)
        records_array
    end

    def self.large_menu
        # find all the restaurants with more than 20 dishes

        sql =   "SELECT restaurants.*, COUNT(dishes.restaurant_id)
                AS dish_count
                FROM restaurants
                INNER JOIN dishes
                ON restaurants.id = dishes.restaurant_id
                GROUP BY dishes.restaurant_id
                HAVING dish_count > 20"

        records_array = ActiveRecord::Base.connection.execute(sql)
        records_array
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
