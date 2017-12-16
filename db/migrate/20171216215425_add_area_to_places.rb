class AddAreaToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :area, :integer
  end
end
