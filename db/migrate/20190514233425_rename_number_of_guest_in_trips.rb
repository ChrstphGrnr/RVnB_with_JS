class RenameNumberOfGuestInTrips < ActiveRecord::Migration[5.2]
  def change
    rename_column :trips, :number_of_guest, :guests
  end
end
