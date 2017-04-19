class Category < ApplicationRecord
  has_many :categorize, :dependent => :delete_all
  has_many :posts, through: :categorize
end
