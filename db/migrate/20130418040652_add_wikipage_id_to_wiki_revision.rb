class AddWikipageIdToWikiRevision < ActiveRecord::Migration
  def change
    add_column :wiki_revisions, :wikipage_id, :integer
  end
end
