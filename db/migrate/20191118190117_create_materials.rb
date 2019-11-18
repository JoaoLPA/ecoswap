class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.text :description
      t.string :amount
      t.text :location
      t.integer :price
      t.boolean :available
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
