class RemoveTemplateToPages < ActiveRecord::Migration[5.0]
  def change
    remove_column :pages, :template, :boolean
  end
end
