class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.belongs_to :event, index: true

      t.string :name

      t.timestamps
    end
  end
end
