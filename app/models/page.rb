class Page < ApplicationRecord
  
  validates :title, presence: true, length: {minimum:5}
  validates :body, presence: true
  validates :slug, presence: true
    
  def to_param
   slug
  end
    
  def self.search(search)
    where("title LIKE ? OR body LIKE ?", "%#{search}%", "%#{search}%") 
  end
  
end
