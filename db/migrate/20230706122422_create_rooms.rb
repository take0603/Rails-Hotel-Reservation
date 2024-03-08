class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :price
      t.string :address
      t.text :explanation

      t.timestamps
    end
  end
end
