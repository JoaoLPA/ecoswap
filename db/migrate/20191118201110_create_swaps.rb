class CreateSwaps < ActiveRecord::Migration[5.2]
  def change
    create_table :swaps do |t|
      t.references :user, foreign_key: true
      t.references :material, foreign_key: true

      t.timestamps
    end
  end
end
