class CreateAuthCodes < ActiveRecord::Migration
  def change
    create_table :auth_codes do |t|
      t.integer :id
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
