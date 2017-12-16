class RemoveCityAndAreaFromPlaces < ActiveRecord::Migration[5.1]
  def change
    remove_column :places, :city, :string
    remove_column :places, :area, :integer
  end
end
