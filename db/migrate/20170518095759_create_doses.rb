class CreateDoses < ActiveRecord::Migration[5.0]
  def change
    create_table :doses do |t|
      t.text :description
      t.references :ingredient, index: true, foreign_key: true
      t.references :cocktail, index: true, foreign_key: true

      t.timestamps
    end
  end
end
