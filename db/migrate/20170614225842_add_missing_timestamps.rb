class AddMissingTimestamps < ActiveRecord::Migration[5.1]
  def change
    
      add_column(:uploads, :created_at, :datetime)
      add_column(:uploads, :updated_at, :datetime)
      
  end
end
