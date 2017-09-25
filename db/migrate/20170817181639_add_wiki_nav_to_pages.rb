class AddWikiNavToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :wikiNav, :text
  end
end
