class Page < ApplicationRecord
    
  def to_param
   slug
  end
    
  def self.search(search)
    where("title LIKE ? OR body LIKE ?", "%#{search}%", "%#{search}%") 
  end
  
end
