class User < ApplicationRecord
    has_one :profile
    has_many :posts
    has_many :notifications
end
