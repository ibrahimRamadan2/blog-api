class Article < ApplicationRecord
    has_and_belongs_to_many :categories
    has_many :comments
    belongs_to :user
end
