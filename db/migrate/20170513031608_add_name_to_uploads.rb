class AddNameToUploads < ActiveRecord::Migration[5.0]
  def change
    add_column :uploads, :name, :string
  end
end
