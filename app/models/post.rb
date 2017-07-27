class Post < ApplicationRecord
  scope :published, proc {
    where(:status => 'Published').where('publish_time <= ?', Time.zone.now)
  }
  
  validates :title, presence: true, length: {minimum:5}
  validates :body, presence: true
  validates :status, presence: true
  has_many :taggings, :dependent => :delete_all
  has_many :tags, through: :taggings
  has_many :categorize, :dependent => :delete_all
  has_many :categories, through: :categorize
  #before_save :ensure_published_at, :if => :status == "Published"
  
  
 
  def to_param
   slug
  end
  
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
  
  def self.search(search)
    where("title ILIKE ? OR body ILIKE ?", "%#{search}%", "%#{search}%") 
  end
  
   protected
  def ensure_published_at
    # Set it to current time if none has been specified.
    self.publish_time ||= Time.zone.now
  end
  
end
