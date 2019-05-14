class CreateRvs < ActiveRecord::Migration[5.2]
  def change
    create_table :rvs do |t|
      t.string :name
      t.integer :owner_id
      t.integer :sleeps
      t.string :price

      t.timestamps
    end
  end
end
