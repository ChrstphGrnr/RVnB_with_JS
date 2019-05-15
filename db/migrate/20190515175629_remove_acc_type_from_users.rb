class RemoveAccTypeFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :acc_type, :string
  end
end
