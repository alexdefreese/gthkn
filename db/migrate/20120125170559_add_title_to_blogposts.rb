class AddTitleToBlogposts < ActiveRecord::Migration
  def self.up
    add_column :blogposts, :title, :string
  end

  def self.down
    remove_column :blogposts, :title
  end
end
