class CreateInitiationRequirements < ActiveRecord::Migration
  def change
    create_table :initiation_requirements do |t|
      t.integer :id
      t.boolean :professor_invited
      t.boolean :dues_paid
      t.boolean :lab_chip_party_attended
      t.boolean :service_project
      t.integer :user_id

      t.timestamps
    end
  end
end
