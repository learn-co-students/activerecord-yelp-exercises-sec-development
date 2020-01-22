require 'pry'

class Review < ActiveRecord::Base
    belongs_to :reviewer, :class_name => "Customer", :foreign_key => "reviewer_id", optional: false
    belongs_to :restaurant, optional: false
    validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
    validate :content_length
    validate :reviewer_placed_an_order?

    def content_length
        if self.content.length <= 10
            errors.add(:content, "A review's content must be at least 10 characters long")
        end
    end

    def reviewer_placed_an_order?
        restaurant = Restaurant.find(self.restaurant_id)
        customer = Customer.find(self.reviewer_id)
        
        customer_orders = Order.select{ |order| order.orderer_id == customer.id }

        found_restaurant = customer_orders.find{ |order| order.restaurant == restaurant }

        if !found_restaurant
            errors.add(:restaurant, "Customers cannot review a restaurant that they have not placed an order from")
        end
    end

    def self.median_rating
        # median rating for all reviews

        ordered_reviews = self.order(:rating)

        median = nil

        if ordered_reviews.count % 2 == 0
            top_middle = ordered_reviews[ordered_reviews.count / 2].rating
            bottom_middle = ordered_reviews[ (ordered_reviews.count / 2) - 1 ].rating

            median = (top_middle + bottom_middle) / 2.0
        else
            median = ordered_reviews[ordered_reviews.count / 2].rating
        end

        median
    end

    def self.most_recent
        # most recent 10 reviews

        self.order("date DESC").limit(10)
    end
end