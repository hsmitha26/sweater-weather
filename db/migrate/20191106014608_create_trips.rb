class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :origin
      t.string :destination
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
