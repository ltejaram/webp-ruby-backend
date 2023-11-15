class CreateDrivers < ActiveRecord::Migration[7.1]
  def change
    create_table :drivers do |t|
      t.integer :driver_id
      t.string :name
      t.integer :bus_id

      t.timestamps
    end
  end
end
