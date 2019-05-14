class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.integer :renter_id
      t.integer :rv_id
      t.integer :number_of_guest
      t.string :start_date
      t.string :end_date
      t.string :name

      t.timestamps
    end
  end
end
