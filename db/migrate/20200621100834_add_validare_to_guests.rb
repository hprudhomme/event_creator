class AddValidareToGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :validate, :boolean, default:  false
  end
end
