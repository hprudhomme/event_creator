class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.belongs_to :user, index: true

      t.string :title
      t.string :catégorie
      t.text :description
      t.datetime :date
      t.boolean :public

      t.timestamps
    end
  end
end
