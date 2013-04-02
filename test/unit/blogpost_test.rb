# == Schema Information
#
# Table name: blogposts
#
#  id         :integer          not null, primary key
#  content    :text(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string(255)
#

require 'test_helper'

class BlogpostTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
