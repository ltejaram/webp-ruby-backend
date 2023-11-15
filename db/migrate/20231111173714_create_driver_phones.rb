class CreateDriverPhones < ActiveRecord::Migration[7.1]
  def change
    create_table :driver_phones do |t|
      t.integer :driver_id
      t.string :phone

      t.timestamps
    end
  end
end
