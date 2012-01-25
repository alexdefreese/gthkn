class AddMemberToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :member, :boolean
  end

  def self.down
    remove_column :users, :member
  end
end
