class AddAdmittedToGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :admitted, :boolean, default:  false
  end
end
