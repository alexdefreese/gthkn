require 'spec_helper'

feature "SignUps" do

  describe "GET /sign_up" do

    it "should exist" do
      visit new_user_registration_path
      page.should have_content "Sign Up"
    end

    it "should create a user" do
      visit new_user_registration_path
      fill_in "Name", with: 'Test User'
      fill_in "Email", with: 'test@gatech.edu'
      fill_in "Password", with: 'foobarfoo'
      fill_in "Password confirmation", with: 'foobarfoo'
      click_button "Sign up"
      page.should have_content("signed up successfully")
    end

  end

end
