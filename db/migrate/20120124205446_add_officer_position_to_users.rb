class AddOfficerPositionToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :officer_position, :string
  end

  def self.down
    remove_column :users, :officer_position
  end
end
