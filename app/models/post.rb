class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum:5}
  validates :body, presence: true
  has_many :taggings, :dependent => :delete_all
  has_many :tags, through: :taggings
  
  
  def all_tags=(names)
    puts "testing 1234"
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
  
end
