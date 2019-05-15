class DropOwnerIdColumFromRvs < ActiveRecord::Migration[5.2]
  def change
    remove_column :rvs, :owner_id
  end
end
