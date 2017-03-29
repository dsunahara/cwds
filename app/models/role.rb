class Role < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  has_many :assignments, :dependent => :destroy
  has_many :users, through: :assignments
  
  
  
  def return_roles()
    roles = Role.joins(:assignments).where(assignments: {user_id:[self.id]})
  end
  
  #check to see if role exist
  def role?(role)
    roles.any? {|r| r.name.underscore.to_sym == role}
  end
  
end
