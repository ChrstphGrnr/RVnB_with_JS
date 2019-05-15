class RenameTypeToAccTypeInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :type, :acc_type
  end
end
