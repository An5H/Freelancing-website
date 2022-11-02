class Post < ApplicationRecord
    belongs_to :user
    has_one_attached :avatar
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
end
