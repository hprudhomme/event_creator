class AddAdmittedToGuest < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :admitted, :integer
  end
end
