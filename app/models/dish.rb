require 'pry'

class Dish < ActiveRecord::Base
    belongs_to :restaurant, optional: false
    has_many :dish_tags
    has_many :tags, through: :dish_tags
    validates :name, presence: true

    def self.names
        self.select(:name)
    end

    def self.max_tags
        sql =   "SELECT dishes.*, COUNT(dish_tags.dish_id)
                AS tag_count
                FROM dishes
                INNER JOIN dish_tags
                ON dishes.id = dish_tags.dish_id
                GROUP BY dish_tags.dish_id
                ORDER BY tag_count DESC
                LIMIT 1"

        records_array = ActiveRecord::Base.connection.execute(sql)
        records_array[0]
    end

    def self.untagged
        #dishes with no tags
    end

    def self.average_tag_count 
        #average tag count for dishes
    end

    def tag_count
        #number of tags for a dish
    end

    def tag_names
        #names of the tags on a dish
    end

    def most_popular_tag
        #most widely used tag for a dish
    end
end