class ChangeOwnerIdToUserId < ActiveRecord::Migration[5.2]
  def change
    rename_column :rvs, :owner_id, :user_id
  end
end
