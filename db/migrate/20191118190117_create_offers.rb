class CreateOffers< ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.text :description
      t.float :amount
      t.string :unit
      t.text :location
      t.decimal :price
      t.boolean :available, default: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
