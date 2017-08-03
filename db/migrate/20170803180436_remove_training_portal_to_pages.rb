class RemoveTrainingPortalToPages < ActiveRecord::Migration[5.0]
  def change
    remove_column :pages, :trainingPortal, :boolean
  end
end
