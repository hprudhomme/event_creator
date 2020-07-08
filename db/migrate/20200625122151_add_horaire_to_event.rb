class AddHoraireToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :horaire, :time
  end
end
