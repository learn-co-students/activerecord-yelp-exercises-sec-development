class Order < ActiveRecord::Base
    belongs_to :orderer, :class_name => "Customer", :foreign_key => "orderer_id", optional: false
    belongs_to :restaurant, optional: false
    has_many :dish_orders
    has_many :dishes, through: :dish_orders
    # before_save :must_have_at_least_one_dish

    # def must_have_at_least_one_dish
    #     if self.dishes.count < 1
    #         errors.add(:dishes, "An order must have at least one dish")
    #     end
    # end

    # I have to make an order (so that I can have the id) before I begin to associate that order with any dishes in my dish_orders table, but how then do I validate that each order does indeed have at least one dish associated with it?

    def total_price
        # sum of the price of all the dishes

        self.dishes.sum("price")
    end

    def profit
        # difference between price and cost of all the order's dishes

        self.dishes.sum("price - cost")
    end

    def profitable?
        self.profit > 0
    end

    def tags
        # tags of all of the dishes in an order

        self.dishes.select("tags.name").joins("INNER JOIN dish_tags ON dishes.id = dish_tags.dish_id").joins("INNER JOIN tags ON dish_tags.tag_id = tags.id").distinct
    end

    def self.orders_with_total_price
        self.select("orders.*, SUM(dishes.price) AS total_price").joins("INNER JOIN dish_orders ON orders.id = dish_orders.order_id").joins("INNER JOIN dishes ON dish_orders.dish_id = dishes.id").group("orders.id")
    end

    def self.cheapest
        # lowest 5 orders by total price

        self.orders_with_total_price.order("total_price ASC").limit(5)
    end

    def self.most_expensive
        # highest 5 orders by total price

        self.orders_with_total_price.order("total_price DESC").limit(5)
    end
end