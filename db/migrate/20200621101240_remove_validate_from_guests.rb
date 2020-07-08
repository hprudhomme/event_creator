class RemoveValidateFromGuests < ActiveRecord::Migration[5.2]
  def change
    remove_column :guests, :validate, :boolean
  end
end
