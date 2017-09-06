class AddDirectoryToUploads < ActiveRecord::Migration[5.1]
  def change
    add_column :uploads, :directory, :string
  end
end
