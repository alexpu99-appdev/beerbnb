class CreateLikedTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :liked_trips do |t|
      t.integer :user_id
      t.integer :trip_id

      t.timestamps
    end
  end
end
