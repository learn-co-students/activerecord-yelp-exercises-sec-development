require 'pry'

class DishOrder < ActiveRecord::Base
    belongs_to :order
    belongs_to :dish
    validate :order_from_one_restaurant
    validate :dish_exists?
    validate :order_exists?

    # let's say we've already instantiated an order (id # 3), and created our first association in this table (order_id: 3, dish_id: whatever)
    # I can use the dish_id to find the restaurant that this order belongs to
    # once I have that, I know that I shouldn't instantiate any new associations in this table unless the new dish that I'm adding also belongs to the same restaurant

    def order_from_one_restaurant
        order = Order.find(self.order_id)
        restaurant = Restaurant.find(order.restaurant_id)

        if self.dish.restaurant_id != restaurant.id
            errors.add(:dish, "All dishes for a single order must be from the same restaurant")
        end
    end

    def dish_exists?
        dish = Dish.find_by(id: self.dish_id)

        if !dish
            errors.add(:dish, "Dish not found")
        end
    end

    def order_exists?
        order = Order.find_by(id: self.order_id)

        if !order
            errors.add(:order, "Order not found")
        end
    end 
end