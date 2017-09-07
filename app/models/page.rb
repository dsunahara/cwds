class Page < ApplicationRecord
  
  validates :title, presence: true, length: {minimum:5}
  validates :body, presence: true
  validates :slug, presence: true
    
  def to_param
   slug
  end
    
end
