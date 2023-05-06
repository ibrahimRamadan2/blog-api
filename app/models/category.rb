class Category < ApplicationRecord
    has_and_belongs_to_many :articles
    has_and_belongs_to_many :users
    validates :name, presence: true
end
