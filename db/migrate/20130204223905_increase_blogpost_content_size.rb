class IncreaseBlogpostContentSize < ActiveRecord::Migration
  def up
    change_column :blogposts, :content, :text
  end

  def down
  end
end
