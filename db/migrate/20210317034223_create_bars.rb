class CreateBars < ActiveRecord::Migration[6.0]
  def change
    create_table :bars do |t|
      t.string :photo
      t.string :website
      t.string :location
      t.string :name

      t.timestamps
    end
  end
end
