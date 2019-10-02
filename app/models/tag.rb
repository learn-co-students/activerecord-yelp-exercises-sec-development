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
end
