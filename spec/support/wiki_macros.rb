module WikiMacros
  def create_wikipage
    wikipage = FactoryGirl.create(:wikipage)
    wiki_revision = FactoryGirl.create(:wiki_revision)
    wiki_revision.user_id = officer.id
    wiki_revision.wikipage_id = wikipage.id
    wikipage.current_revision_id = wiki_revision.id
    wikipage
  end
end