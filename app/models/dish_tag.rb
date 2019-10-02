class DishTag < ActiveRecord::Base
    belongs_to :dish, optional: true
    belongs_to :tag, optional: true
    validate :duplicate_tags

    def duplicate_tags
        duplicate = self.class.all.find{ |dish_tag| dish_tag.dish_id == self.dish_id && dish_tag.tag_id == self.tag_id }
        if duplicate
            errors.add(:dish_id, "This dish already has this tag")
        end
    end
end