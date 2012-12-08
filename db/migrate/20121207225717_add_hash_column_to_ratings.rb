class AddHashColumnToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :MD5Hash, :string
  end
end
