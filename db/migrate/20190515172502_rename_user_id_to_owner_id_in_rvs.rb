class RenameUserIdToOwnerIdInRvs < ActiveRecord::Migration[5.2]
  def change
    rename_column :rvs, :user_id, :owner_id
  end
end
