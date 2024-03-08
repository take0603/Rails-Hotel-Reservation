class AddColumns < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :room, foreign_key: true
    add_reference :users, :reservation, foreign_key: true

    add_reference :rooms, :user, foreign_key: true
    add_reference :rooms, :reservation, foreign_key: true

    add_reference :reservations, :user, foreign_key: true
    add_reference :reservations, :room, foreign_key: true
  end
end
