class IncreaseBlogpostContentSize < ActiveRecord::Migration
  def up
    change_column :blogposts, :content, :text, limit: 5000
  end

  def down
  end
end
