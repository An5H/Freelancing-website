class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :f_name, presence: true
  validates :l_name, presence: true
  validates :username, presence: true
  validates_uniqueness_of :username

end
