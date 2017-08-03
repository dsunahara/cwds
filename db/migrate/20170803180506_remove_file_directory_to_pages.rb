class RemoveFileDirectoryToPages < ActiveRecord::Migration[5.0]
  def change
    remove_column :pages, :fileDirectory, :boolean
  end
end
