class Post < ApplicationRecord
    belongs_to :user
    has_one_attached :avatar
    has_many :likes
    has_many :comments
end
