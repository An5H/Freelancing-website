class Comment < ApplicationRecord
    belongs_to :post
    has_many :likesofcomments
end
