require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature "wiki" do
  let (:officer) {FactoryGirl.create(:officer)}
  let (:member) {FactoryGirl.create(:member)}

  describe "GET /wikipages" do
    it "should deny non-officers" do
      visit wikipages_path
      current_path.should == "/" 
    end

    it "should exist if officer" do
      login_as(officer, :scope => :user)
      visit wikipages_path
      page.should have_content("Wiki Index")
    end
  end

  describe "GET @wikipage" do
    it "should display wikipage title" do
      wikipage = FactoryGirl.create(:wikipage)
      wiki_revision = FactoryGirl.create(:wiki_revision)
      wiki_revision.user_id = officer.id
      wiki_revision.wikipage_id = wikipage.id
      wikipage.current_revision_id = wiki_revision.id
      wikipage.save
      login_as(officer, :scope => :user)
      visit wikipage_path(wikipage)
      page.should have_content wikipage.name
    end
  end

end