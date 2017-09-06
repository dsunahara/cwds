class AddNameToUploads < ActiveRecord::Migration[5.1]
  def change
    add_column :uploads, :name, :string
  end
end
