require 'pry'

class Dish < ActiveRecord::Base
    belongs_to :restaurant, optional: false
    has_many :dish_orders
    has_many :orders, through: :dish_orders
    has_many :orderers, through: :orders
    has_many :dish_tags
    has_many :tags, through: :dish_tags
    validates :name, presence: true
    validate :restaurant_exists?

    def restaurant_exists?
        restaurant = Restaurant.find_by(id: self.restaurant_id)

        if !restaurant
            errors.add(:restaurant_id, "A dish must belong to an existing restaurant")
        end
    end

    def self.names
        self.pluck(:name)
    end

    def self.group_by_tag_count
        # sql =   "SELECT dishes.*, COUNT(dish_tags.dish_id)
        #         AS tag_count
        #         FROM dishes
        #         INNER JOIN dish_tags
        #         ON dishes.id = dish_tags.dish_id
        #         GROUP BY dish_tags.dish_id

        # records_array = ActiveRecord::Base.connection.execute(sql)
        # records_array[0]

        # self.select('dishes.*, COUNT(dish_tags.dish_id) AS tag_count').joins(:dish_tags).group("dish_tags.dish_id")

        # the previous query method returns a grouping of dishes by tag_count, but only those dishes that are tagged, the following query method returns all dishes by tag_count, regardless of whether they have a tag or not 

        self.left_outer_joins(:dish_tags).select("dishes.*, COUNT(dish_tags.dish_id) AS tag_count").group("dish_tags.dish_id")
    end

    def self.max_tags
        # single dish with the most tags

        self.group_by_tag_count.order("tag_count desc").limit(1)
    end

    def self.untagged
        #dishes with no tags

        self.group_by_tag_count.having("tag_count = ?", 0)
    end

    def self.average_tag_count 
        #average tag count for dishes

        average = 0

        self.all.each do |dish|
            average += dish.tag_count
        end

        average / self.count.to_f

        # this method works, but I'm not using 100% ActiveRecord query methods here - I cannot use the .average method on tag_count because it is not recognized as a column name by SQL (even when trying to chain it onto the .group_by_tag_count method above)
    end

    def tag_count
        #number of tags for a dish

        self.dish_tags.count
    end

    def tag_names
        self.tags.pluck(:name)
    end

    def top_customer
        # customer who has ordered a dish the most times

        Customer.select("customers.*, COUNT(customers.id) AS order_count_by_customer").joins("INNER JOIN orders ON customers.id = orders.orderer_id").joins("INNER JOIN dish_orders ON orders.id = dish_orders.order_id").joins("INNER JOIN dishes ON dishes.id = dish_orders.dish_id").where("dishes.id = ?", self.id).group("customers.id").order("order_count_by_customer DESC").first
    end

    def self.most_ordered
        # most ordered dish

        self.select("dishes.*, COUNT(dishes.id) AS order_count").joins("INNER JOIN dish_orders ON dishes.id = dish_orders.dish_id").group("dishes.id").order("order_count DESC").first
    end

    # this method is moot because the specs require a validation that a dish cannot be tagged with the same tag twice (no duplicates)

    # def most_popular_tag
    #     #most widely used tag for a dish   
    # end
end