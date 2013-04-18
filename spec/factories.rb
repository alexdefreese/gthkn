FactoryGirl.define do

  factory :member, class: User do
    name "Test member"
    email "testuser@gatech.edu"
    member true
    password "foobarfoo"
  end

  factory :officer, class: User do
    name "Test officer"
    email "testofficer@gatech.edu"
    member true
    officer true
    officer_position "Example Officer"
    password "foobarfoo"
  end

  factory :wiki_revision do
    content "Some Test Content"
  end

  factory :wikipage do
    name "Test Wikipage"
  end

end