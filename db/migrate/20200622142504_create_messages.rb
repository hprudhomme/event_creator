class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.belongs_to :event, index: true
      
      t.string :content
      t.integer :author

      t.timestamps
    end
  end
end
