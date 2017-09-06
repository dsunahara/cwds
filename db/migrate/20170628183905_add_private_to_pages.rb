class AddPrivateToPages < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :private, :boolean
  end
end
