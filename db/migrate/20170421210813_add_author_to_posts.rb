class AddAuthorToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :author, :string
    add_column :posts, :status, :string
    add_column :posts, :publish_time, :datetime
  end
end
