class AddPhotosToPlaces < ActiveRecord::Migration[5.1]
  def change
    change_table :photos do |t|
      t.references :place, foreign_key: true
    end
  end
end
