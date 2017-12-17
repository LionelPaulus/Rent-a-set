class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.belongs_to :user, foreign_key: true
      t.references :photo, foreign_key: true
      t.string :name
      t.text :description
      t.string :category
      t.string :address
      t.string :city
      t.integer :area
      t.integer :exposure
      t.integer :price

      t.timestamps
    end
  end
end
