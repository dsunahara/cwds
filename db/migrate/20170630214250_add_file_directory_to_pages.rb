class AddFileDirectoryToPages < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :fileDirectory, :boolean, :default => false
    add_column :pages, :fileFolder, :string
  end
end
