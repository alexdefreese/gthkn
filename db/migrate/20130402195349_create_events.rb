class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :id
      t.string :title
      t.text :description
      t.date :date_occurred

      t.timestamps
    end
  end
end
