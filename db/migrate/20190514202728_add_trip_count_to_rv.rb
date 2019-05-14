class AddTripCountToRv < ActiveRecord::Migration[5.2]
  def change
    add_column :rvs, :trip_count, :integer
  end
end
