class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :posts, through: :categorizations

  validates :name, length: {minimum: 3}, presence: true, uniqueness: true
end
