class Article < ApplicationRecord
    has_and_belongs_to_many :categories
    has_many :comments
    belongs_to :user

    validates_presence_of :title, :description
    validate :must_have_at_least_one_category

    def must_have_at_least_one_category
      if categories.empty?
        errors.add(:categories, "must include at least one category")
      end
    end
end
