class AddCoumnReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :payment, :integer
  end
end
