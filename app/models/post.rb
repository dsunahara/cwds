class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum:5}
  validates :body, presence: true
  has_many :taggings, :dependent => :delete_all
  has_many :tags, through: :taggings
  has_many :categorize, :dependent => :delete_all
  has_many :categories, through: :categorize
  
  
  def all_categories=(names)
    self.categories = names.split(",").map do |name|
        Category.where(name: name.strip).first_or_create!
    end
  end
  
  def all_categories
    self.categories.map(&:name).join(", ")
  end
  
  
  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end
  
  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end
  
  def self.categorized_with(name)
    Category.find_by_name!(name).posts
  end
  
end
