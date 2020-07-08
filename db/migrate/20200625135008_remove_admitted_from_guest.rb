class RemoveAdmittedFromGuest < ActiveRecord::Migration[5.2]
  def change
    remove_column :guests, :admitted, :boolean
  end
end
