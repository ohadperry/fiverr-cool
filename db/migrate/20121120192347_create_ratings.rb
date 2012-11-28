class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.text :pic_url , :null => false  , :unique => true
      t.float :rating, :default=>1400

      t.timestamps
    end
  end
end
