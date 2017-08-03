class AddTemplateToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :template, :string
  end
end
