class AddTemplateToPages < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :template, :string
  end
end
