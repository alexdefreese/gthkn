class CreateWikipages < ActiveRecord::Migration
  def change
    create_table :wikipages do |t|
      t.integer :id
      t.string :name
      t.integer :current_revision_id

      t.timestamps
    end
  end
end
