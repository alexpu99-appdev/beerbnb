class CreateAirbnbs < ActiveRecord::Migration[6.0]
  def change
    create_table :airbnbs do |t|
      t.string :location
      t.float :price
      t.string :website
      t.string :photo

      t.timestamps
    end
  end
end
