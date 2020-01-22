require 'pry'

class Restaurant < ActiveRecord::Base
    has_many :dishes
    has_many :orders
    has_many :customers, through: :orders
    has_many :reviews
    validates :name, presence: true

    scope :with_long_names, -> { where('LENGTH(name) > ?', 12) }

    def self.mcdonalds
        self.find_by(name: 'McDonalds')
    end

    def self.tenth
        self.find(10)
    end

    def self.group_by_dish_count
        self.select('restaurants.*, COUNT(dishes.restaurant_id) AS dish_count').joins(:dishes).group("dishes.restaurant_id")

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

        # sql = 'SELECT restaurants.*, COUNT(dishes.restaurant_id) AS dish_count FROM restaurants
        # INNER JOIN dishes
        # ON dishes.restaurant_id = restaurants.id
        # INNER JOIN dish_tags
        # ON dish_tags.dish_id = dishes.id
        # INNER JOIN tags
        # ON dish_tags.tag_id = tags.id
        # WHERE tags.name = "vegetarian"
        # GROUP BY restaurants.id'

        # records_array = ActiveRecord::Base.connection.execute(sql)

        # this SQL returns a table in which each restaurant has a column, dish_count, that is a count of all of the vegetarian dishes, but I can't seem to get it to work with ActiveRecord query methods

        veg = Tag.find_by(name: "vegetarian")

        self.select do |rest|
            # go through each restaurant
            rest.dishes.all? do |dish|
                # go through each of that restaurant's dishes
                dish.tags.include?(veg)
                # if ALL of that restaurant's dishes include the vegetarian tag, then select it
            end
        end

        # this is a triple nested loop!!! Seems pretty expensive, but I don't know how to make this work with SQL queries
    end

    def self.name_like(name)
        # find all restaurants where the name is like the name passed in

        self.where("name LIKE ?", "%#{name}%")
    end

    def self.name_not_like(name)
        # find all restaurants where the name is not like the name passed in

        self.where("name NOT LIKE ?", "%#{name}%")
    end

    def average_rating
        # average rating of a restaurant

        self.reviews.average("rating").round(1).to_f
    end

    def self.average_rating
        # average rating across all restaurants

        self.joins(:reviews).average("rating").round(1).to_f
    end

    def self.ordered_by_average_rating
        self.select("restaurants.*, AVG(reviews.rating) AS ratings_average").joins(:reviews).group("restaurants.id").order("ratings_average DESC")
    end

    def self.highest_rated
        # highest average rated restaurant

        self.ordered_by_average_rating.first
    end

    def self.top_five
        # top 5 highest rated restaurants

        self.ordered_by_average_rating.limit(5)
    end

    def average_dish_price
        self.dishes.average("price").round(2).to_f
    end

    def dollar_rating
        # how many dollar signs is this restaurant?

        # $: avg_dish_price < 10
        # $$: 10 < avg_dish_price < 20
        # $$$: 20 < avg_dish_price < 30
        # $$$$: 30 < avg_dish_price

        dollar_signs = nil

        if self.average_dish_price < 10
            dollar_signs = '$'
        elsif self.average_dish_price < 20
            dollar_signs = '$$'
        elsif self.average_dish_price < 30
            dollar_signs = '$$$'
        else 
            dollar_signs = '$$$$'
        end

        dollar_signs
    end

    def self.ordered_by_average_dish_price
        self.select("restaurants.*, AVG(dishes.price) AS average_dish_price").joins(:dishes).group("restaurants.id").order("average_dish_price DESC")
    end

    def self.most_expensive
        # most expensive restaurant by average dish price

        self.ordered_by_average_dish_price.first
    end

    def self.cheap_eats
        # all $ and $$ restaurants

        self.ordered_by_average_dish_price.having("average_dish_price < ?", 20)
    end

    def distance_from_customer(customer)
        x1 = customer.lat
        x2 = self.lat

        y1 = customer.lon
        y2 = self.lon

        distance = Math.sqrt((x2 - x1)**2 + (y2 - y1)**2)
    end

    # in the deliverables, this method is described as a class method, which doesn't make much sense, so I'm converting it into an instance method instead
    def nearest_customers
        # nearest 5 customers

        customers = Customer.all.sort{ |a, b| self.distance_from_customer(a) - self.distance_from_customer(b) }

        customers.slice(0, 5)
    end

    # again, this method is described as a class method in the deliverables, which doesn't make sense - converting it into an instance method instead
    def recent_reviews
        # 5 most recent reviews of this restaurant

        self.reviews.order(:date).limit(5)
    end

    def best_seller
        # most ordered dish for the restaurant

        Dish.select("dishes.*, COUNT(dishes.id) AS num_times_dish_ordered").joins("INNER JOIN dish_orders ON dishes.id = dish_orders.dish_id").joins("INNER JOIN restaurants ON dishes.restaurant_id = restaurants.id").where("restaurants.id = ?", self.id).group("dishes.id").order("num_times_dish_ordered DESC").first
    end

    def most_profitable_dish
        # (price - cost) * number of orders

        Dish.select("dishes.*, ((dishes.price - dishes.cost) * COUNT(dishes.id)) AS total_profit").joins("INNER JOIN dish_orders ON dishes.id = dish_orders.dish_id").joins("INNER JOIN restaurants ON dishes.restaurant_id = restaurants.id").where("restaurants.id = ?", self.id).group("dishes.id").order("total_profit DESC")
    end
end
