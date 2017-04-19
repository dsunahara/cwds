class CreateCategorizes < ActiveRecord::Migration[5.0]
  def change
    create_table :categorizes do |t|
      t.belongs_to :post, foreign_key: true
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
