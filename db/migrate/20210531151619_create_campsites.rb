class CreateCampsites < ActiveRecord::Migration[6.0]
  def change
    create_table :campsites do |t|
      t.string :name
      t.text :address
      t.text :description
      t.float :price_per_night
      t.integer :capacity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
