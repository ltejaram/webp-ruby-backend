class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :name
      t.string :email
      t.string :password
      t.string :phone

      t.timestamps
    end
  end
end
