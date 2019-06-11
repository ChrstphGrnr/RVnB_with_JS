class AddOwnerIdToRvs < ActiveRecord::Migration[5.2]
  def change
    add_column :rvs, :owner_id, :integer
  end
end
