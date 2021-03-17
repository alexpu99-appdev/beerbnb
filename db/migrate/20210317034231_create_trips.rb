class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.integer :airbnb_id
      t.integer :bar_id

      t.timestamps
    end
  end
end
