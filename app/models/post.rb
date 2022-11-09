class Post < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy

    validates :job_type, presence: true
    validates :job_heading, presence: true
    validates :job_description, presence: true
    validates :additional_info, presence: true
end
