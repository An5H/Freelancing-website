class Comment < ApplicationRecord
    belongs_to :post
    has_many :likesofcomments, dependent: :destroy
    default_scope { order('created_at DESC') }
end
