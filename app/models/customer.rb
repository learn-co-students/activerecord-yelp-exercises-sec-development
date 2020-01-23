require "pry"

class Customer < ActiveRecord::Base
    has_many :orders, :foreign_key => "orderer_id"
    has_many :dish_orders, through: :orders
    has_many :dishes, through: :dish_orders
    has_many :reviews, :foreign_key => "reviewer_id"

    validates :name, presence: true
    # Customer lat and lon must be valid latitude and longitude (-90 < lat < 90, -180 < lon < 180)
    validates :lat, numericality: { greater_than: -90, less_than: 90 }
    validates :lon, numericality: {
        greater_than: -180, less_than: 180
    }

    def recent_reviews
        # all reviews by this customer, ordered by recency
        self.reviews.order("date desc")
    end

    # may not need this method

    # def distance_from_restaurant(restaurant)
    #     # formula to find the distance between two points - square root of (x2 - x1)squared + (y2 - y1)squared
        
    #     x1 = restaurant.lat
    #     x2 = self.lat

    #     y1 = restaurant.lon
    #     y2 = self.lon

    #     distance = Math.sqrt((x2 - x1)**2 + (y2 - y1)**2)
    # end

    def nearest_restaurant
        # nearest_restaurant to the customer's location
        restaurants = Restaurant.all.sort{ |a, b| a.distance_from_customer(self) - b.distance_from_customer(self) }

        restaurants[0]

        # this method is not using SQL queries and may be a little expensive (using sort), but I don't know how to create a new column on restaurants using a sql calculation for square root
    end

    def top_restaurant
        # restaurant where the customer has the most orders
        orders_with_rest_count = self.orders.select("orders.*, COUNT(orders.restaurant_id) AS restaurant_count").group("orders.restaurant_id").order("restaurant_count desc").limit(1)[0].restaurant
    end

    def top_dish
        # mostly commonly ordered dish for the customer

        # SELECT dishes.*, COUNT(dishes.id) AS dish_count
        # FROM dishes
        # INNER JOIN dish_orders
        # ON dish_orders.dish_id = dishes.id
        # INNER JOIN orders
        # ON dish_orders.order_id = orders.id 
        # INNER JOIN customers
        # ON orders.orderer_id = customers.id
        # WHERE customers.id = 2
        # GROUP BY dishes.id
        # ORDER BY dish_count DESC

        # this SQL query returns a table with a unique list of all the dishes that a particular user has ordered, and the number of times that dish has been ordered (it shows the correct data in the SQLite browser)

        # this query using ActiveRecord query methods works, but only after I specified the INNER JOINS ON

        # dishes = Dish.select("dishes.*, COUNT(dishes.id) AS dish_count").joins(:dish_orders).joins("INNER JOIN orders ON dish_orders.order_id = orders.id").joins("INNER JOIN customers ON orders.orderer_id = customers.id").where("customers.id = ?", self.id).group("dishes.id").order("dish_count desc")

        self.dishes.select("dishes.*, COUNT(dishes.id) AS dish_count").group("dishes.id").order("dish_count DESC").first
    end

    def total_spending
       self.dishes.sum("price")
    end

    def self.top_spenders
        self.select("customers.*, SUM(dishes.price) AS total_spent").joins("INNER JOIN orders ON customers.id = orders.orderer_id").joins("INNER JOIN dish_orders ON orders.id = dish_orders.order_id").joins("INNER JOIN dishes ON dish_orders.dish_id = dishes.id").group("customers.id").order("total_spent DESC").limit(5)
    end
end