class AddMissingTimestamps < ActiveRecord::Migration[5.0]
  def change
    add_timestamps :uploads, default: Time.now 
  end
end
