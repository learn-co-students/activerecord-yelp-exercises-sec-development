class Tag < ActiveRecord::Base
    has_many :dish_tags
    has_many :dishes, through: :dish_tags
    validates :name, presence: true
    validate :name_length
    validate :name_num_of_words

    def name_length
        if self.name && self.name.length < 3
            errors.add(:name, "Must be at least 3 characters long")
        end
    end

    def name_num_of_words
        name = "Italian cuisine"
        name2 = "pastry"
        num_of_words = nil

        if self.name
            num_of_words = self.name.split(' ')
        end

        if self.name && num_of_words.length > 2
            errors.add(:name, "Name cannot be more than two words")
        end
    end

    def self.most_common
        #tag with the most associated dishes
    end

    def self.least_common
        #tag with the fewest associated dishes
    end

    def self.unused
        #all tags that haven't been used
    end

    def self.uncommon
        #all tags that have been used fewer than 5 times
    end

    def self.popular
        #top 5 tags by use
    end

    def restaurants
        #restaurants that have used this tag on at least one dish
    end

    def top_restaurant
        #restaurant that uses this tag the most
    end

    def dish_count
        #how many dishes use this tag
    end
end
