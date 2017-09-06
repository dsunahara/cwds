class RemoveFileDirectoryToPages < ActiveRecord::Migration[5.1]
  def change
    remove_column :pages, :fileDirectory, :boolean
  end
end
