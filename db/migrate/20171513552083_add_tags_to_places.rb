class AddTagsToPlaces < ActiveRecord::Migration[5.1]
  def change
    change_table :places do |t|
      t.references :tag, foreign_key: true
    end
  end
end
