class CreateWikiRevisions < ActiveRecord::Migration
  def change
    create_table :wiki_revisions do |t|
      t.integer :id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
