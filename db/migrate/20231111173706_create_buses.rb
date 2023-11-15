class CreateBuses < ActiveRecord::Migration[7.1]
  def change
    create_table :buses do |t|
      t.integer :bus_id
      t.string :from_location
      t.string :to_location
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
