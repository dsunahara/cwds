class AddPrivateToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :private, :boolean
  end
end
